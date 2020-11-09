function deleteOldGmails() {
  //7日より前の件名(subject)LuckyDaysまたは【fantia】を削除する。
  //日付はd 月の場合はmで指定する。
  var delayDays = '7d';
  //検索クエリー。参考:https://support.google.com/mail/answer/7190?hl=ja
  var deleteThreads = GmailApp.search('older_than:' + delayDays + ' {subject:LuckyDays subject:【fantia】} ');

  for (var i = 0; i < deleteThreads.length; i++) {
    deleteThreads[i].moveToTrash();
  }
}
