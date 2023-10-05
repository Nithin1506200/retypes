module T = {
  type dataRangePickerCallback = unit => unit
  type dateOrString
  type datePickerEvents = [
    | #"show.daterangerpicker"
    | #"hide.daterangerpicer"
    | #"showCalendar.daterangepicker"
    | #"hideCalendar.daterangepicker"
    | #"apply.daterangepicker"
    | #"cancel.daterangepicker"
  ]
  type datepickerEventObject = {
    date: Js.Date.t,
    format: (~format: string=?) => string,
  }
  type month = {firstDay: string}
  type locale = {
    cancelLabel?: string,
    /**
         * Text for apply label.
         */
    applyLabel?: string,
    /**
         * Text for fromLabel label.
         */
    fromLabel?: string,
    /**
         * Text for toLabel label.
         */
    toLabel?: string,
    /**
         * Format of the date string. example: 'YYYY-MM-DD'
         */
    format?: string,
    /**
         * Separator between the startDate and endDate in the attached input element. Example: ' - '
         */
    separator?: string,
    /**
         * Text for the week label.
         */
    weekLabel?: string,
    /**
         * Text for the custom range label.
         */
    customRangeLabel?: string,
    /**
         * The first day of the week (0-6, Sunday to Saturday).
         */
    firstDay?: int,
    /**
         * Weekday names displayed in the header of calendar.
         */
    daysOfWeek?: array<string>,
    /**
         * Month names used in the month select boxes.
         */
    monthNames?: array<string>,
  }
}

