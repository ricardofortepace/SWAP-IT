import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["buttons"];

  connect() {
    console.log(this.buttonsTargets.firstElementChild);
  }

  active(event) {
    this.buttonsTargets.forEach((button) => {
      console.log(button);
    });

    event.currentTarget.classList.toggle("quadrado");
  }
}
