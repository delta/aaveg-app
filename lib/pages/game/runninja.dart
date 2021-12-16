import 'dart:ui';
import 'package:aaveg_app/pages/game/constants.dart';
import 'package:aaveg_app/pages/game/rungame.dart';
import 'package:flame/anchor.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_events.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/time.dart';

class RunNinja extends AnimationComponent
    with HasGameRef<RunGame>, JoystickListener {
  Animation _runAnimation;
  Animation _jumpAnimation;
  Animation _slideAnimation;
  Animation _attackAnimation;
  Timer _timer;
  double attacktime = 0.0;
  double slidetime = 0.0;
  double speedY = 0.0;
  double yMax = 0.0;
  double yCent = 0.0;

  SpriteSheet clanRun(String c) {
    switch (c) {
      case 'Agni':
        return SpriteSheet(
          imageName: '${c}run.png',
          textureWidth: 376,
          textureHeight: 550,
          columns: 10,
          rows: 1,
        );
      default:
        return SpriteSheet(
          imageName: '${c}run.png',
          textureWidth: 363,
          textureHeight: 460,
          columns: 10,
          rows: 1,
        );
    }
  }

  SpriteSheet clanJump(String c) {
    switch (c) {
      case 'Agni':
        return SpriteSheet(
          imageName: '${c}jump.png',
          textureWidth: 399,
          textureHeight: 543,
          columns: 10,
          rows: 1,
        );
      default:
        return SpriteSheet(
          imageName: '${c}jump.png',
          textureWidth: 362,
          textureHeight: 483,
          columns: 10,
          rows: 1,
        );
    }
  }

  SpriteSheet clanSlide(String c) {
    switch (c) {
      case 'Agni':
        return SpriteSheet(
          imageName: '${c}slide.png',
          textureWidth: 397,
          textureHeight: 450,
          columns: 10,
          rows: 1,
        );
      default:
        return SpriteSheet(
          imageName: '${c}slide.png',
          textureWidth: 373,
          textureHeight: 390,
          columns: 10,
          rows: 1,
        );
    }
  }

  SpriteSheet clanAttack(String c) {
    switch (c) {
      case 'Agni':
        return SpriteSheet(
          imageName: '${c}attack.png',
          textureWidth: 525,
          textureHeight: 600,
          columns: 4,
          rows: 1,
        );
      case 'Aakash':
        return SpriteSheet(
          imageName: '${c}attack.png',
          textureWidth: 525,
          textureHeight: 540,
          columns: 4,
          rows: 1,
        );
      case 'Jal':
        return SpriteSheet(
          imageName: '${c}attack.png',
          textureWidth: 509,
          textureHeight: 540,
          columns: 4,
          rows: 1,
        );
      case 'Vayu':
        return SpriteSheet(
          imageName: '${c}attack.png',
          textureWidth: 512,
          textureHeight: 540,
          columns: 4,
          rows: 1,
        );
      case 'Prithvi':
        return SpriteSheet(
          imageName: '${c}attack.png',
          textureWidth: 525,
          textureHeight: 530,
          columns: 4,
          rows: 1,
        );
      default:
        return SpriteSheet(
          imageName: '${c}attack.png',
          textureWidth: 525,
          textureHeight: 530,
          columns: 4,
          rows: 1,
        );
    }
  }

  RunNinja(String c) : super.empty() {
    final runSheet = clanRun(c);
    final jumpSheet = clanJump(c);
    final slideSheet = clanSlide(c);
    final attackSheet = clanAttack(c);
    _runAnimation = runSheet.createAnimation(0, from: 0, to: 9, stepTime: 0.1);
    _jumpAnimation =
        jumpSheet.createAnimation(0, from: 0, to: 9, stepTime: 0.1);
    _slideAnimation =
        slideSheet.createAnimation(0, from: 0, to: 9, stepTime: 0.1);
    _attackAnimation =
        attackSheet.createAnimation(0, from: 0, to: 3, stepTime: 0.1);

    animation = _runAnimation;

    _timer = Timer(1, callback: () {
      run();
    });

    anchor = Anchor.center;
  }

  @override
  void resize(Size size) {
    super.resize(size);

    height = width = size.height / 5.5;

    x = width + size.width / 12;
    y = size.height - 130 - (height / 2) + dinoTopBottomSpacing;
    yMax = y;
    yCent = height / 2;
  }

  @override
  void update(double t) {
    super.update(t);
    if (!(slidetime <= 0)) {
      if (gameRef.size != null) {
        y = gameRef.size.height - 122 - (height / 2) + dinoTopBottomSpacing;
      }
    } else {
      speedY += gravity * t;
      y += speedY * t;
    }

    if (isOnGround()) {
      y = yMax;
      speedY = 0.0;
      if (!(slidetime <= 0)) {
        slidetime -= 10;
        animation = _slideAnimation;
        height = width = gameRef.size.height / 6.25;
        y = gameRef.size.height - 122 - (height / 2) + dinoTopBottomSpacing;
      } else if (!(attacktime <= 0)) {
        attacktime -= 10;
        animation = _attackAnimation;
        height = width = gameRef.size.height / 4.5;
      } else {
        slidetime = 0;
        attacktime = 0;
        gameRef.isAttaking = false;
        if (gameRef.size != null) {
          height = width = gameRef.size.height / 5.6;
        }
        animation = _runAnimation;
      }
    } else {
      height = width = gameRef.size.height / 5.5;
      animation = _jumpAnimation;
    }
    _timer.update(t);
  }

  bool isOnGround() => y >= yMax;

  void run() {
    animation = _runAnimation;
  }

  void onJump() {
    if (isOnGround()) speedY = -(699 / 669 * gameRef.size.height);
  }

  void onSlide() {
    if (isOnGround()) slidetime = 250;
  }

  void onAttack() {
    if (isOnGround()) {
      gameRef.isAttaking = true;
      attacktime = 350;
    }
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.id == 0 && (gameRef.stamina > 0.25)) onAttack();
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (event.directional == JoystickMoveDirectional.MOVE_UP ||
        event.directional == JoystickMoveDirectional.MOVE_UP_LEFT ||
        event.directional == JoystickMoveDirectional.MOVE_UP_RIGHT) {
      onJump();
    } else if (event.directional == JoystickMoveDirectional.MOVE_DOWN ||
        event.directional == JoystickMoveDirectional.MOVE_DOWN_LEFT ||
        event.directional == JoystickMoveDirectional.MOVE_DOWN_RIGHT) {
      onSlide();
    } else if (event.directional == JoystickMoveDirectional.MOVE_LEFT ||
        event.directional == JoystickMoveDirectional.MOVE_RIGHT ||
        event.directional == JoystickMoveDirectional.IDLE) {
      animation = _runAnimation;
    }
  }
}
