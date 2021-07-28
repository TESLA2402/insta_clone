class allposts {
  late String who;
  late String when;
  late String what;
  late String caption;
  late List likedby;
  late String url;

  allposts({
    required String who,
    required String when,
    required String caption,
    required String what,
    required List likedby,
    required url,
  }) {
    this.who = who;
    this.when = when;
    this.what = what;
    this.likedby = likedby;
    this.caption = caption;
    this.url = url;
  }
}
/*
List<allposts> posts = [
  allposts(
      who: "Rick",
      when: "2 hr ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e', 'rick']),
  allposts(
      who: "john",
      when: "5 hr ago",
      what: 'assets/posts/john.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'John']),
  allposts(
      who: "rock",
      when: "12 hr ago",
      what: 'assets/posts/Rock.jpeg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "jensen",
      when: "1 day ago",
      what: 'assets/posts/jensen.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e']),
  allposts(
      who: "jack",
      when: "2 day ago",
      what: 'assets/posts/john.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd']),
  allposts(
      who: "Rick",
      when: "3 day ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "Jensen",
      when: "3 day ago",
      what: 'assets/posts/jensen.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "Jack",
      when: "3 day ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e']),
  allposts(
      who: "Rock",
      when: "4 day ago",
      what: 'assets/posts/Rock.jpeg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd']),
  allposts(
      who: "Jensen",
      when: "5 day ago",
      what: 'assets/posts/jensen.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "Rock",
      when: "6 day ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "Me",
      when: "7 day ago",
      what: 'assets/posts/john.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e']),
  allposts(
      who: "Roman",
      when: "6 day ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd']),
  allposts(
      who: "Rick",
      when: "8 day ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "John",
      when: "8 day ago",
      what: 'assets/posts/john.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c']),
  allposts(
      who: "Me",
      when: "8 day ago",
      what: 'assets/posts/rick.jpg',
      caption: 'hi',
      likedby: ['a']),
  allposts(
      who: "Rick",
      when: "2 hr ago",
      what: 'assets/posts/jensen.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e', 'rick']),
  allposts(
      who: "Rick",
      when: "2 hr ago",
      what: 'assets/posts/jensen.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e', 'rick']),
  allposts(
      who: "Rick",
      when: "2 hr ago",
      what: 'assets/posts/john.jpg',
      caption: 'hi',
      likedby: ['a', 'b', 'c', 'd', 'e', 'rick']),
];
*/
