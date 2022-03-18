import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    var cnt1 = document.getElementById("count1");
    var water1 = document.getElementById("water1");
    var percent1 = cnt1.innerText;
    var interval1;

    interval1 = setInterval(function () {
      percent1++;
      cnt1.innerHTML = percent1;
      water1.style.transform = "translate(0" + "," + (100 - percent1) + "%)";
      if (percent1 == 71) {
        clearInterval(interval1);
      }
    }, 60);

    var cnt2 = document.getElementById("count2");
    var water2 = document.getElementById("water2");
    var percent2 = cnt2.innerText;
    var interval2;

    interval2 = setInterval(function () {
      percent2++;
      cnt2.innerHTML = percent2;
      water2.style.transform = "translate(0" + "," + (100 - percent2) + "%)";
      if (percent2 == 47) {
        clearInterval(interval2);
      }
    }, 60);

    var cnt3 = document.getElementById("count3");
    var water3 = document.getElementById("water3");
    var percent3 = cnt3.innerText;
    var interval3;

    interval3 = setInterval(function () {
      percent3++;
      cnt3.innerHTML = percent3;
      water3.style.transform = "translate(0" + "," + (100 - percent3) + "%)";
      if (percent3 == 3) {
        clearInterval(interval3);
      }
    }, 60);
  }
}
