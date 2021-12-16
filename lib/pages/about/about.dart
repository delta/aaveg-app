import 'package:aaveg_app/pages/about/aboutpage.dart';
import 'package:aaveg_app/pages/about/pagedot.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        'clan': 'Aaveg',
        'description':
            '5 different clans, each united through more than just the plethora of memes, GIFs and stickers, are set for an enigmatic experience. As we redefine Aaveg’ 21 virtually, the fun and galore of the fest is building as each day goes by. So, who will be our victors?. \n \n @sponsors \n\n Meera Medicals (Health Partner)  \n Vibe Store (Merchandise Partner) \n Bookary (Book Partner) \n Eventozo (Party Partner)',
        'logo': 'assets/images/aavegwhite.png'
      },
      {
        'clan': 'Agni',
        'description':
            'Agni, often viewed as the impulsive and rebellious one amongst the entities, redeems herself by being an exemplary and assertive leader. She is extremely passionate about her nation and protective of her people. She is characterized by willpower, patriotism, and authority.  While her temper can occasionally impede her judgement, her loyal following and council never ceases to leave her side. Your people are constantly inspired by her and vow to follow her stead. Ignited by your passion, fuelled by your will, and driven by your sheer power, none can stand before your might. Heavily influenced by personal life experiences and impulses, you are a person who craves action. The banners of Agni burn bright not only at the brink of war but also in your heart. You are decisive and firm in your convictions, Exhibiting enormous levels of patriotism. ',
        'logo': 'assets/images/Agni.webp'
      },
      {
        'clan': 'Aakash',
        'description':
            'Just like the sky watches over all life forms, Aakash too keeps an eye on all that happens down below. He doesn\'t get lost in the clouds of doubt that span across the earth. Rays of sun to fall through, birthing and ceasing our day. Aakash lets it rain where there\'s a drought and shine where there\'s a flood, the tiniest shift of his mood changes even the calm sunny summer hues into a dark stormy blue with lightning crackling across.Seize the day! The time for you to shine is here. Being on the lookout for the easier path often leads you into the road less traveled by the rest. One can often find you strolling through the empty library halls with your nose buried in a tome, hungrily devouring its contents. You ensure that the t\'s are crossed and the i\'s are dotted, unable to accept anything less than perfection, They say the sky is the limit.',
        'logo': 'assets/images/Aakash.webp'
      },
      {
        'clan': 'Jal',
        'description':
            'Jal is the embodiment of water. The vast oceans, meandering rivers and mighty seas are at Jal’s command and ready to be released with a flick of his wrist. A drop of water to quench your thirst or a tsunami to cleanse the land, Jal does it all. His devotion to your people is rewarded by equal, if not more, loyalty. Jal’s shrewd analytical skills help come up with innumerable solutions in the face of peril, but this very trait can sometimes put him in jeopardy. Your astute brilliance has held your kingdom together in the face of many difficulties. You might not be the first to step up with a solution but the one you present is certainly unbeatable. Your impeccable wisdom provides an objective view mindless of his own feelings and notions. The ease with which water contorts its form, unrestricted in shape, unobstructed by hindrances.',
        'logo': 'assets/images/Jal.webp'
      },
      {
        'clan': 'Prithvi',
        'description':
            'Prithvi, despite his all-pervasive powers, is never the one to exploit these powers for personal gain. The vast ecosystem lies in his grasp. Life, as we know it, is facilitated by his nurturing. While Prithvi has created the very soil you walk over, he is NOT one to let anybody walk over him. His actions mirror his heart, as he is not one to sugar-coat his words to appease others. He is grounded in reality, and never lets his fantasies get the best of him. His composure and fair sense of justice in his ruling has won the hearts of you and your people. Your composure in the face of adversity, brutal honesty and straightforwardness is remarkable. You are gentle and supportive yet fiercely competitive, resilient and persistent. Your People are both literally and figuratively, “Down to earth” and never let their virtues get to their head.',
        'logo': 'assets/images/Prithvi.webp'
      },
      {
        'clan': 'Vayu',
        'description':
            'Vayu is anywhere and everywhere and is the very air you breathe. He wields the power of the howling winds, the destructive tornados and the gentle breeze. He ensures our life’s sustenance. Be it a small gust of air in your ear or a gush that upturns your umbrella, Vayu’s mischief is inescapable. His powerful draughts uproot even the sturdiest of trees. Be it a prank or a sarcastic comment, Vayu is the first to interest you with it. The trials and tests of life do not hold you back from doing what you like. The generic barriers of the society do not inhibit you from expressing yourself. You know how to guise yourself so as to get what you desire. Your jovial attitude complements your happy-to-go lucky self. With every breath of Vayu, one inhales a perfect blend of mischief, freedom and happiness; which is essential for life like the oxygen he provides.',
        'logo': 'assets/images/Vayu.webp'
      }
    ];
    return Scaffold(
        body: Stack(children: [
      const Background(),
      Center(
          child: PageView(
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              controller: _controller,
              children: [
            for (int index = 0; index < list.length; index++)
              AboutPage(
                  page: index,
                  image: list[index]['logo'],
                  description: list[index]['description']),
          ])),
      Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 16),
          child: Wrap(
              direction: Axis.horizontal,
              spacing: 12,
              children: list.map<Widget>((item) {
                var index = list.indexOf(item);
                var bool = currentPage == index;
                return PageDot(
                  isSelected: bool,
                  onTap: () {
                    setState(() {
                      currentPage = index;
                      _controller.animateToPage(currentPage,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    });
                  },
                );
              }).toList()))
    ]));
  }
}
