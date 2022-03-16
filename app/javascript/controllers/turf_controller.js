import { Controller } from "@hotwired/stimulus"
import { point, distance } from "@turf/turf";

export default class extends Controller {
  static values = {
    currentLatitude: Number,
    currentLongitude: Number,
    userStuffLongitude: Number,
    userStuffLatitude: Number
  }

  static targets = ["distancia"]

  connect() {

    const from = point([this.currentLongitudeValue, this.currentLatitudeValue]);
    const to = point([this.userStuffLongitudeValue, this.userStuffLatitudeValue]);

    const options = {units: 'kilometers'};

    const distancia = Math.round(distance(from, to, options),-1);

    this.distanciaTarget.insertAdjacentHTML("beforeend", `<p class="their-description">${distancia}<spam>km</spam></p>`)


  }
}
