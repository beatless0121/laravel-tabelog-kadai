flatpickr('#reservation_date', {
  locale: 'ja',
  minDate: 'today',
  maxDate: new Date().fp_incr(60),
  // その店舗の定休日を選択不可にする
  disable: [
    function (date) {
      return shopRegularHolidays.includes(date.getDay());
    }
  ]
});