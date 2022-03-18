import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  connect() {
    this.buttonTarget.classList.add("quadrado");
  }

  active(event) {
    this.buttonTargets.forEach((button) => {
      button.classList.remove("quadrado");
    });

    event.currentTarget.classList.add("quadrado");
  }
}
