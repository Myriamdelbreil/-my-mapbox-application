import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"]
  static values = {
    markers: Array
  }

  connect() {
    L.Icon.Default.imagePath = 'https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/images/';

    this.mapContainer = this.element;
    const map = L.map(this.mapContainer).setView([this.markersValue[0].lat, this.markersValue[0].lng], 13);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);
    const markersCluster = L.markerClusterGroup();
    this.markersValue.forEach(marker => {
      const lat = parseFloat(marker.lat);
      const lng = parseFloat(marker.lng);
      const leafletMarker = L.marker([lat, lng]);
      const popup = marker.info_window_html;
      leafletMarker.bindPopup(popup);
      markersCluster.addLayer(leafletMarker);
    })
    map.addLayer(markersCluster);
  }
}
