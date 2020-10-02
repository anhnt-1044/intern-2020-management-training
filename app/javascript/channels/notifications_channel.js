import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    $('#list-notifications').prepend(data.html);
    $('.counter.text-bold').html(data.num_of_notifies);
  }
});
