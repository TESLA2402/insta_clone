class allstories {
  late String who;
  late String when;
  late String what;
  allstories(
      {required String who, required String when, required String what}) {
    this.who = who;
    this.when = when;
    this.what = what;
  }
}

List<allstories> stories = [
  allstories(
    who: "Rick",
    when: "2 hr ago",
    what: 'assets/posts/rick.jpg',
  ),
  allstories(
    who: "jack",
    when: "5 hr ago",
    what: 'assets/posts/Rock.jpeg',
  ),
  allstories(
    who: "jensen",
    when: "1 day ago",
    what: 'assets/posts/jensen.jpg',
  ),
  allstories(
    who: "Rick",
    when: "2 day ago",
    what: 'assets/posts/rick.jpg',
  ),
  allstories(
    who: "Me",
    when: "3 day ago",
    what: 'assets/posts/Rock.jpeg',
  ),
  allstories(
    who: "First",
    when: "4 day ago",
    what: 'assets/posts/john.jpg',
  ),
  allstories(
    who: "Second",
    when: "5 day ago",
    what: 'assets/posts/jensen.jpg',
  ),
  allstories(
    who: "Third",
    when: "6 day ago",
    what: 'assets/posts/rick.jpg',
  ),
  allstories(
    who: "john",
    when: "6 day ago",
    what: 'assets/posts/jensen.jpg',
  ),
  allstories(
    who: "Third",
    when: "6 day ago",
    what: 'assets/posts/john.jpg',
  ),
  allstories(
    who: "Third",
    when: "6 day ago",
    what: 'assets/posts/Rock.jpeg',
  ),
  allstories(
    who: "Third",
    when: "6 day ago",
    what: 'assets/posts/jensen.jpg',
  ),
];
