import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/location_view_model.dart';
import 'detail_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationsState = ref.watch(locationSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: '지역을 검색하세요',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
          ),
          onSubmitted: (value) {
            ref.read(locationSearchProvider.notifier).searchLocation(value);
          },
        ),
      ),
      body: locationsState.when(
        data: (locations) {
          if (locations.isEmpty) {
            return const Center(child: Text('검색어를 입력하세요'));
          }
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];
              return ListTile(
                title: Text(location.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(location.category),
                    Text(location.roadAddress),
                  ],
                ),
                onTap: () {
                  if (location.link.startsWith('https')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(url: location.link),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('오류: $error')),
      ),
    );
  }
}
