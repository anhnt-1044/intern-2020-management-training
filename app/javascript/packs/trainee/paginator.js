export function scrollPaginator() {
  if ($('#subject-paginator .pagination').length && $('#list-subjects').length) {
    $(window).on('scroll', function() {
      let next_item = $('#subject-paginator .pagination .active').next();
      let more_subjects_url;
      if (next_item.length == 1) {
        more_subjects_url = $(next_item).children().first().attr("href");
      } else {
        more_subjects_url = $('#subject-paginator .pagination .active a').first().attr('href');
      }
      if (more_subjects_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('#subject-paginator .pagination').html('<img src="/assets/widget-loader-lg-en.gif" height="40" />');
        setTimeout(() => {
          $.getScript(more_subjects_url);
        }, 1000);
      }
    });
  }
}
