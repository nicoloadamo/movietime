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
      time_24hr: true,
      altInput: true,
      altFormat: "j F, Y",
      dateFormat: "d-m-Y"
    })
    flatpickr(this.endTimeTarget, {
      enableTime: true,
      altInput: true,
      altFormat: "j F, Y",
      time_24hr: true,
    })
  }
}
