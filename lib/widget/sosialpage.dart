import 'package:flutter/material.dart';
import 'homepage.dart';
import 'chatdetailpage.dart';
import 'package:alone/home.dart'; 

class SosialPage extends StatefulWidget {
  const SosialPage({super.key});

  @override
  State<SosialPage> createState() => _SosialPageState();
}

class _SosialPageState extends State<SosialPage> {
  final List<_Friend> _friends = const [
    _Friend(name: 'Andi Pratama', xp: 1250, avatarColor: Colors.orange),
    _Friend(name: 'Siti Rahma', xp: 980, avatarColor: Colors.purple),
    _Friend(name: 'Budi Santoso', xp: 720, avatarColor: Colors.teal),
    _Friend(name: 'Dewi Lestari', xp: 540, avatarColor: Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                'Teman',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const _SimpleTabs(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: _friends.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final friend = _friends[index];
                  return _FriendTile(friend: friend, rank: index + 1);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        onTap: (index) {
          if (index == 2) return;
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          }
          if (index == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.headphones), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Siswa"),
        ],
      ),
    );
  }
}

class _Friend {
  final String name;
  final int xp;
  final Color avatarColor;

  const _Friend({
    required this.name,
    required this.xp,
    required this.avatarColor,
  });
}

class _SimpleTabs extends StatelessWidget {
  const _SimpleTabs();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xff58A700),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Teman',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Cari Teman',
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================================
// Satu baris daftar teman — sekarang ada tombol chat
// ==========================================================
class _FriendTile extends StatelessWidget {
  final _Friend friend;
  final int rank;

  const _FriendTile({required this.friend, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$rank',
              style: const TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: friend.avatarColor,
            child: Text(
              friend.name[0],
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              friend.name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.bolt, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(
                '${friend.xp} XP',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(width: 8),

          // ⬅️ TOMBOL CHAT BARU: tekan ikon ini untuk masuk ke room chat orang ini
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Color(0xff58A700)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(
                    name: friend.name,
                    avatarColor: friend.avatarColor,
                    // Belum ada pesan sebelumnya karena baru mulai chat dari sini
                    openingMessage: null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}