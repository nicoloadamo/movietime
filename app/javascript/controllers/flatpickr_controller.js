// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]

  connect() {

    flatpickr(this.startTimeTarget, {
      enableTime: true,
      minDate: "today",
      defaultDate: "19:00",
      time_24hr: true,
      dateFormat: "d-m-Y"
    })
    flatpickr(this.endTimeTarget, {
      enableTime: true,
      defaultDate: "22:00",
      time_24hr: true,
      dateFormat: "d-m-Y"
    })
  }
}
