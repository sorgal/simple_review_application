$(document).ready(function() {

  $(document).on('click', 'div.dropdown.rating ul li', function(e) {
    var el = $(this);
    var value = el.text();
    var drop_div = el.closest('div.dropdown.rating');
    drop_div.find('button#dropdownMenu1 span.rating_header').text(value);
    var object_id = drop_div.attr('data-object-id');
    if (drop_div.attr('data-object-type') === 'review') {
      drop_div.closest('table.comments').find('#new_comment_for_' + object_id + ' #rating_value').val(value);
    } else if (drop_div.attr('data-object-type') === 'comment') {
      sendCommentUpdateRequest(object_id, value);
    }
    drop_div.removeClass('open');
    return false;
  });

  function sendCommentUpdateRequest(object_id, value) {
    $.ajax({
      method: 'POST',
      url: '/comments/' + object_id + '/update_rating',
      data: { comment: { rating_value: value } },
      dataType: 'script'
    })
    .done(function(response) {
    });
  }

});
