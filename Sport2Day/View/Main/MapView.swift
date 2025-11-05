
// [Alex] 29/10  récupération de mes tests mapKit
// Ajout des Cell
// SearchCellView fonctionnel uniquement pour l'adresse
// Map début
// La bar de recherche n'est pas encré
//[Alex] 03/11 Tout les élléménets sont fonctinelle, ajout du bouton creatActivity
// [Alex] 04/11 bouton create activity fonctionnelle

import SwiftUI
import MapKit
import SwiftData
import CoreLocation

struct MapView: View {
    //  Environment & Data
    @Environment(\.modelContext) private var context
    @Query private var activities: [Activity]
    @Query(filter: #Predicate<User> { $0.userName == "Erika" }) private var erikaUsers: [User]

    var currentUser: User { erikaUsers.first! }

    //  State
    @State private var selectedActivity: Activity?
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    @State private var showFilterPopup = false
    @State private var showListView = false
    @State private var showCreateActivity = false

    @State private var searchText = ""
    @State private var filters = SearchFilters.empty
    @Namespace private var animation
    @State private var refreshID = UUID()
    @State private var isSearching = false

    //  Body
    var body: some View {
        ZStack {
            Color("bluePrimary").ignoresSafeArea()

            //  Main Content
            VStack(spacing: 12) {
                headerSection
                contentSection
            }

            // Floating Action Button
            floatingActionButton

            //  Activity Popup (Bottom Sheet Style)
            if let activity = selectedActivity {
                activityPopup(activity: activity)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .activityCreated)) { _ in
            refreshID = UUID()
        }
        .id(refreshID)
        .sheet(isPresented: $showFilterPopup) {
            SearchFilterPopUpView(searchText: $searchText) { newFilters in
                filters = newFilters
                if !newFilters.searchText.isEmpty {
                    Task { await geocodeAndMove(to: newFilters.searchText) }
                }
            }
        }
        .sheet(isPresented: $showCreateActivity) {
            CreateActivityView()
        }
    }

    //  Header (Search + Tabs)
    private var headerSection: some View {
        VStack(spacing: 8) {
            searchBar
            tabSwitcher
        }
        .padding(.top, 30)
        .padding(.horizontal, 16)
    }

    private var searchBar: some View {
        Button { showFilterPopup = true } label: {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white.opacity(0.9))
                Text(searchText.isEmpty ? "Rechercher une activité" : searchText)
                    .foregroundColor(.white.opacity(0.9))
                    .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal)
            .frame(height: 42)
            .background(Color("containerGray"))
            .cornerRadius(10)
        }
    }

    private var tabSwitcher: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("containerGray"))

            HStack(spacing: 0) {
                tabButton(title: "Carte", isActive: !showListView) {
                    withAnimation(.easeInOut(duration: 0.25)) { showListView = false }
                }

                tabButton(title: "Liste", isActive: showListView) {
                    withAnimation(.easeInOut(duration: 0.25)) { showListView = true }
                }
            }
            .padding(4)
        }
        .frame(height: 44)
    }

    private func tabButton(title: String, isActive: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .background(
                    Group {
                        if isActive {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.orangePrimary)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    }
                )
                .foregroundColor(isActive ? .white : .white.opacity(0.7))
        }
    }

    //  Content (Map or List)
    private var contentSection: some View {
        Group {
            if showListView {
                MapListView(activities: filteredActivities)
                    .background(Color("bluePrimary").ignoresSafeArea())
                    .transition(.opacity)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 16)
            } else {
                MapCellView(
                    position: $position,
                    activities: filteredActivities,
                    selectedActivity: $selectedActivity
                )
                .ignoresSafeArea(edges: .bottom)
                .padding(.horizontal, 8)
                .padding(.top, 8)
                .transition(.opacity)
            }
        }
    }

    //  Floating Action Button
    private var floatingActionButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button { showCreateActivity = true } label: {
                    Image(systemName: "plus")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.orangePrimary)
                        .padding(20)
                        .background(
                            Circle()
                                .fill(Color.white.opacity(0.8))
                                .overlay(Circle().stroke(Color.orangePrimary.opacity(0.9), lineWidth: 1))
                        )
                        .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                }
                .padding(.trailing, 22)
                .padding(.bottom, 32)
            }
        }
    }

    //  Activity Popup (Animated from Bottom)
    @ViewBuilder
    private func activityPopup(activity: Activity) -> some View {
        // Background dim
        Color.black.opacity(0.1)
            .ignoresSafeArea()
            .onTapGesture {
                dismissPopup()
            }
            .zIndex(1)

        // Popup content
        VStack {
            Spacer()
            ActivityInfoPopupCellView(activity: activity) {
                dismissPopup()
            }
            .padding(.bottom, 150)
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .zIndex(2)
        }
    }

    private func dismissPopup() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
            selectedActivity = nil
        }
    }

    //  Geocoding
    private func geocodeAndMove(to address: String) async {
        await MainActor.run { isSearching = true }
        let geocoder = CLGeocoder()
        do {
            let placemarks = try await geocoder.geocodeAddressString(address)
            if let coordinate = placemarks.first?.location?.coordinate {
                withAnimation(.easeInOut) {
                    position = .region(
                        MKCoordinateRegion(
                            center: coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                        )
                    )
                }
            }
        } catch {
            print("Erreur géocodage : \(error.localizedDescription)")
        }
        await MainActor.run { isSearching = false }
    }

    // Filtered Activities
    @MainActor
    private var filteredActivities: [Activity] {
        let snapshot = Array(activities)
        return snapshot.filter { activity in
            guard !filters.searchText.isEmpty else { return true }
            return activity.activityLocation.lowercased().contains(filters.searchText.lowercased())
        }
    }
}

// ounded Corners Extension (if needed elsewhere)
fileprivate extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
}

fileprivate struct RoundedCornerShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
