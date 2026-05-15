import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ipot/components/loadings/container_shimmer_load.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LabelAvatar extends StatelessWidget {
  final String? url;
  final double size;
  final double radius;
  final bool _isLoading;

  const LabelAvatar({
    super.key,
    required this.url,
    this.size = 72,
    this.radius = 12,
  }) : _isLoading = false;

  const LabelAvatar.loading({super.key, this.size = 72, this.radius = 12})
    : url = null,
      _isLoading = true;

  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.grey.shade100,
      ),
      child: _isLoading
          ? ContainerShimmerLoad(radius: radius)
          : _isValidUrl(url)
          ? CachedNetworkImage(
              imageUrl: url!,
              fit: BoxFit.cover,
              placeholder: (_, _) => ContainerShimmerLoad(radius: radius),
              errorWidget: (_, _, _) => _placeholder(),
            )
          : _placeholder(),
    );
  }

  Widget _placeholder() => Center(
    child: PhosphorIcon(
      PhosphorIconsRegular.image,
      size: size * 0.38,
      color: Colors.grey.shade400,
    ),
  );
}
