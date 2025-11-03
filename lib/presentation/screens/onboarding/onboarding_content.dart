import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// OnboardingContent is a reusable slide widget for the onboarding flow.
class OnboardingContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 96),
          const SizedBox(height: 24),
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

/// OnboardingPage is a reusable slide widget using a Lottie animation and text.
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String lottieAsset;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.lottieAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset(
              lottieAsset,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


