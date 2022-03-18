import { Controller } from "@hotwired/stimulus";
// import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["likeform"];

  connect() {
    console.log("Conectou ao like_button controller");
  }

  submitlike(event) {
    // console.log(this.liketrueTarget);
    const like = document.getElementById("like_status_true");
    like.checked = true;
    this.likeformTarget.submit();
  }

  submitdislike(event) {
    // console.log(this.liketrueTarget);
    const dislike = document.getElementById("like_status_false");
    dislike.checked = true;
    this.likeformTarget.submit();
  }

}
