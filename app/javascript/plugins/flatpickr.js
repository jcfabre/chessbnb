import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  dateFormat: "d.m.Y"
})

flatpickr(".hourpicker", {
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
  defaultDate: "19:00",
  time_24hr: true
})
