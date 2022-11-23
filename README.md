# tugas 8
### Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
- Navigator.push : menambahkan route ke stack rute yang dikelola oleh Navigator
- Navigator.pushReplacement : menambahkan route yang baru dan kemudian membuang route sebelumnya setelah route baru selesai di-load

###  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Padding : Mengatur posisi-posisi dari widget didalamnya
- Column : Mengatur widget child nya dalam posisi vertikal
- Form : Untuk meminta, menyimpan, memakai input data dari user
- ListTile : seperti row, tetapi juga bisa menyimpan teks sebagai leading dan trailing
- Card : Jujur kayak card di bootstrap aja sih, tapi isinya widget kayak ListTile dan sebagainya
- Drawer : Seperti Navbar di bootstrap

###  Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onSaved: event yang terjadi ketika widget disimpan
- onTap: event yang terjadi ketika widget di tap
- onPressed: event yang terjadi ketika widget di klik
- onChanged: event yang terjadi ketika widget diubah

###  Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Halaman di flutter itu seperti stack. Navigator.push menaruh halaman baru di atas halaman sebelumnya. Navigator.pop menghapus halaman teratas sehingga kembali ke halaman dibawahnya

###  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat file form.dart
2. Membuat budget.dart ( gunanya budget.dart itu seperti models.py di django, yaa engga mirip mirip banget sihh, tapi intinya adalah penyimpanan data berbentuk collection yang bisa di pass ke berbagai file dart) (https://github.com/rafimadani/pbp-flutter-lab/blob/main/lib/budget.dart) 
2. Mengedit file form.dart agar bisa meminta input dari user, sekaligus validasi input, dan menyimpan input yang sudah valid ke class budget (https://github.com/rafimadani/pbp-flutter-lab/blob/main/lib/form.dart) 
3. Membuat drawer.dart yang berisi drawer navigasi di app (https://github.com/rafimadani/pbp-flutter-lab/blob/main/lib/drawer.dart)
4. Mendeclare MyDrawer() di setiap file di folder lib
3. Membuat data.dart
4. Mengedit file data.dart agar bisa menampilkan data yang ada di class budget, termasuk menghandle exception bila tidak ada data di class budget (sehingga tidak error) (https://github.com/rafimadani/pbp-flutter-lab/blob/main/lib/data.dart)
5. Selesai :)
# tugas 7

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah immutable widget, dalam artian adalah  widget yang tidak bisa berubah dan diubah selama runtime-app. Contohnya Icon, IconButton, dan Text.
Stateful Widget adalah mutable widget, adalah  widget yang bisa berubah selama runtime-app. Contohnya adalah Checkbox, RadioButton, Slider.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- MaterialApp (widget untuk mmebuat background dan nama app)
- Scaffold    (widget untuk mengimplementasikan layout Materal diatas)
- AppBar      (widget untuk bar di top layar)
- Center      (Widget untuk memposisikan children/isi dari body ke tengah)
- Column      (Layout widget yang memposisikan children nya vertikal)
- Text        (widget untuk menyimpan teks)
- Padding     (widget untuk mengatur posisi dari children nya)
- Row         (Widget untuk memposisikan children nya horizontal)
- FLoatingActionButton (Widget untuk mendeclare button lingkaran)
- Spacer      (Memberi spasi antar widget children)

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() berfungsi untuk memanggil kembali build(BuildContext context) setiap setState() dipanggil. setState() mengubah nilai _counter dan _kata.

### Jelaskan perbedaan antara const dengan final.

Const dan final memiliki perbedaan dimana variabel final masih bisa dubah kedepannya (hardcoded), sementaraa Const tidak. Seperti contoh, bila suatu collection dideclare dengan Const, maka semua value didalamnya juga bersifat Const dan tidak bisa diubah. Namun, bila collection dideclare dengan final, maka value didalamnya bukan final sehingga masih bisa diubah

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Membuat Variabel String Genap dan Ganjil di Class Myhomepage
```
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String kata = "GENAP";
  String _genap = "GENAP";
  String _ganjil = "GANJIL";

```

- Membuat styling warna untuk Genap dan Ganjil di Children di Column
```
children: <Widget>[
            Text(
              kata,
              style: TextStyle(
                color: (kata==_ganjil
                ?Colors.blue //true
                :Colors.red), //false
                ),
            ),
            Text(
              '$_counter',

            ),
          ],
```

- Membuat function _decrementCounter

```
  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the displ8ay can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
      if (_counter%2==0){
         kata = _genap;
      }
      else{
        kata = _ganjil;
      }
    });
  }

```

- Mengatur padding dan declare button untuk decrement
```
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Row(
          children: <Widget>[
            if (_counter!=0)
              FloatingActionButton(onPressed: _decrementCounter,child : const Icon(Icons.remove)),
            const Spacer(),
            FloatingActionButton(onPressed: _incrementCounter,child : const Icon(Icons.add)),
```
