import 'package:aaveg_app/models/score_response.dart';
import 'package:flutter/material.dart';

class ScoreTable extends StatelessWidget {
  final EventsScore eventsScore;

  const ScoreTable({Key key, this.eventsScore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text('Culturals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(0, 0),
                        blurRadius: 0,
                        color: Colors.grey.shade800,
                      ),
                    ],
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )))),
      SliverToBoxAdapter(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.symmetric(
                      outside:
                          BorderSide(color: Colors.grey.shade700, width: 0.5),
                      inside:
                          BorderSide(width: 1, color: Colors.grey.shade700)),
                  children: [
                    TableRow(
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(1111)),
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Text(
                                'Event',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 0,
                                        color: Colors.grey.shade900,
                                      ),
                                    ],
                                    letterSpacing: 1.2,
                                    fontStyle: FontStyle.italic,
                                    fontSize: size.width * 0.023,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Text('Aakash',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 0,
                                        color: Colors.grey.shade900,
                                      ),
                                    ],
                                    letterSpacing: 1.2,
                                    fontSize: size.width * 0.025,
                                    fontStyle: FontStyle.italic,
                                  ))),
                          Text('Agni',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Jal',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Prithvi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Vayu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              ))
                        ])
                  ]))),
      SliverToBoxAdapter(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.symmetric(
                      outside:
                          BorderSide(width: 1, color: Colors.grey.shade800),
                      inside:
                          BorderSide(width: 1, color: Colors.grey.shade700)),
                  children: eventsScore.culturals
                      .map((e) => TableRow(
                              decoration: eventsScore.culturals.indexOf(e) %
                                          2 ==
                                      0
                                  ? BoxDecoration(color: Colors.grey.shade900)
                                  : BoxDecoration(color: Colors.grey.shade800),
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Text(
                                      e.eventName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: const Offset(0, 0),
                                              blurRadius: 0,
                                              color: Colors.grey.shade900,
                                            ),
                                          ],
                                          letterSpacing: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: size.width * 0.021,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 2),
                                    child: Text(e.aakash.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: const Offset(0, 0),
                                                blurRadius: 0,
                                                color: Colors.grey.shade900,
                                              ),
                                            ],
                                            letterSpacing: 1.2,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold))),
                                Text(e.agni.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text(e.jal.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text(e.prithvi.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text(e.vayu.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold))
                              ]))
                      .toList()))),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      ),
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text('Spectrum',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(0, 0),
                        blurRadius: 0,
                        color: Colors.grey.shade800,
                      ),
                    ],
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )))),
      SliverToBoxAdapter(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.symmetric(
                      outside:
                          BorderSide(color: Colors.grey.shade700, width: 0.5),
                      inside:
                          BorderSide(width: 1, color: Colors.grey.shade700)),
                  children: [
                    TableRow(
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(1111)),
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Text(
                                'Event',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 0,
                                        color: Colors.grey.shade900,
                                      ),
                                    ],
                                    letterSpacing: 1.2,
                                    fontStyle: FontStyle.italic,
                                    fontSize: size.width * 0.025,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Text('Aakash',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        color: Colors.grey.shade900,
                                      ),
                                    ],
                                    letterSpacing: 1.2,
                                    fontSize: size.width * 0.025,
                                    fontStyle: FontStyle.italic,
                                  ))),
                          Text('Agni',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Jal',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Prithvi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Vayu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    color: Colors.grey.shade800,
                                  ),
                                ],
                                letterSpacing: 1.2,
                                fontSize: size.width * 0.025,
                                fontStyle: FontStyle.italic,
                              ))
                        ])
                  ]))),
      SliverToBoxAdapter(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.symmetric(
                      outside:
                          BorderSide(width: 1, color: Colors.grey.shade800),
                      inside:
                          BorderSide(width: 1, color: Colors.grey.shade700)),
                  children: eventsScore.spectrum
                      .map((e) => TableRow(
                              decoration: eventsScore.spectrum.indexOf(e) % 2 ==
                                      0
                                  ? BoxDecoration(color: Colors.grey.shade900)
                                  : BoxDecoration(color: Colors.grey.shade800),
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Text(
                                      e.eventName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                              color: Colors.grey.shade900,
                                            ),
                                          ],
                                          letterSpacing: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: size.width * 0.021,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 2),
                                    child: Text(e.aakash.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(0, 0),
                                                blurRadius: 0,
                                                color: Colors.grey.shade900,
                                              ),
                                            ],
                                            letterSpacing: 1.2,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold))),
                                Text(e.agni.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text(e.jal.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text(e.prithvi.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text(e.vayu.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 0,
                                            color: Colors.grey.shade900,
                                          ),
                                        ],
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold))
                              ]))
                      .toList()))),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      ),
    ]);
  }
}
