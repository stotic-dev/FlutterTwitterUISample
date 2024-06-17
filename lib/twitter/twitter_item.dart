class TweetItem {
  final String name;
  final String message;

  const TweetItem({required this.name, required this.message});

  const TweetItem.defaultItem()
      : name = 'default',
        message = 'sample message';
}
