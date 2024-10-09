import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Particle {
  Offset position;
  double speed;
  double radius;
  Color color;
  Offset direction;

  Particle({
    required this.position,
    required this.speed,
    required this.radius,
    required this.color,
    required this.direction,
  });

  void move(Size size) {
    position += direction * speed;

    if (position.dx > size.width || position.dx < 0) {
      direction = Offset(-direction.dx, direction.dy);
    }
    if (position.dy > size.height || position.dy < 0) {
      direction = Offset(direction.dx, -direction.dy);
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()..color = particle.color;
      canvas.drawCircle(particle.position, particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ParticleBackground extends HookWidget {
  final Widget child;

  const ParticleBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 10),
    )..repeat();

    final particles = useState<List<Particle>>([]);

    // Access MediaQuery in the build method
    final screenSize = MediaQuery.of(context).size;

    // Initialize particles when the screen size is available and changes
    useEffect(() {
      final random = Random();

      // Generate particles based on screen size
      particles.value = List.generate(100, (index) {
        return Particle(
          position: Offset(
            random.nextDouble() * screenSize.width,
            random.nextDouble() * screenSize.height,
          ),
          speed: 1 + random.nextDouble() * 2,
          radius: 2 + random.nextDouble() * 3,
          color: Colors.white.withOpacity(0.5),
          direction: Offset(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1),
        );
      });

      return null; // No cleanup needed
    }, [screenSize]); // Depend on screenSize to update when the screen size changes

    // Add listener for moving particles
    useEffect(() {
      void updateParticles() {
        for (var particle in particles.value) {
          particle.move(screenSize);
        }
      }

      controller.addListener(updateParticles);

      // Clean up the listener when widget is disposed
      return () => controller.removeListener(updateParticles);
    }, [controller, screenSize]);

    return Stack(
      children: [
        CustomPaint(
          size: Size.infinite,
          painter: ParticlePainter(particles.value),
        ),
        child,
      ],
    );
  }
}
