List<String> fakultas = ["Ilmu Komputer", "Kedokteran", "Teknik"];

List<String> semester = ["1", "2", "3", "4", "5", "6", "7", "8"];

List<String> kodeMatkul = [
  "CIF61009",
  "CCE61208",
  "CCE61212",
  "CCE61205",
  "CCE61206"
];

List<String> programStudi = [
  "Teknik Komputer",
  "Teknologi Informasi",
  "Sistem Informasi",
  "Teknik Infomatika",
  "Pendidikan Teknologi Informasi"
];

List<String> tahunKurikulm = ["2020", "2021", "2022"];

List<String> namaMatkul = [
  "Rangakian Elektronika",
  "Pemograman FPGA",
  "Etika Profesi",
  "Pemograman Dasar"
];

List<String> jamKuliah = [
  "07:00-09:00",
  "10:00-12:00",
  "13:00-15:00",
];

List<String> jumlahSks = [
  "24",
  "22",
  "20",
  "18",
];



List<Map<String, dynamic>> rekomendataSenin =[
  {
    'namaMK' : 'Rangkaian Elektronika',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Rangkaian Elektronika',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Rangkaian Elektronika',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Rangkaian Elektronika',
    'jamMK' : '14:00-15:00'
  },

];

List<Map<String, dynamic>> rekomendataSelasa =[
  {
    'namaMK' : 'Etika Profesi',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Etika Profesi',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Etika Profesi',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Etika Profesi',
    'jamMK' : '14:00-15:00'
  },

];
List<Map<String, dynamic>> rekomendataRabu =[
  {
    'namaMK' : 'Pemograman Dasar',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Pemograman Dasar',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Pemograman Dasar',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Pemograman Dasar',
    'jamMK' : '14:00-15:00'
  },

];

List<Map<String, dynamic>> rekomendataKamis =[
  {
    'namaMK' : 'Sistem Linier',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Sistem Linier',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Sistem Linier',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Sistem Linier',
    'jamMK' : '14:00-15:00'
  },

];

List<Map<String, dynamic>> rekomendataJumat =[
  {
    'namaMK' : 'Pemograman FPGA',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Pemograman FPGA',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Pemograman FPGA',
    'jamMK' : '14:00-15:00'
  },
  {
    'namaMK' : 'Pemograman FPGA',
    'jamMK' : '14:00-15:00'
  },

];



class DataMatkul {
  String tahunKurikulm;
  String hari;
  String jam;
  String kodeMK;
  String namaMK;
  String kelas;
  String sks;
  String peminat;
  DataMatkul({
    required this.tahunKurikulm,
    required this.hari,
    required this.jam,
    required this.kodeMK,
    required this.namaMK,
    required this.kelas,
    required this.sks,
    required this.peminat,
  });
}

List<DataMatkul> allDataMatkul = dataMk
    .map((e) => DataMatkul(
          tahunKurikulm: e['tahun_kurikulum'],
          hari: e['hari'],
          jam: e['jam'],
          kodeMK: e['kodeMK'],
          namaMK: e['namaMK'],
          kelas: e['kelas'],
          sks: e['sks'],
          peminat: e['peminat'],
        ))
    .toList();

List<Map<String, dynamic>> dataMk = [
  {
    'tahun_kurikulum': '2020',
    'hari': 'Selasa',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Rangkaian Elektronika',
    'kelas': 'A',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Senin',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Rangkaian Elektronika',
    'kelas': 'B',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Rabu',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Rangkaian Elektronika',
    'kelas': 'C',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Kamis',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Rangkaian Elektronika',
    'kelas': 'D',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Senin',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Dasar',
    'kelas': 'A',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Selasa',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Dasar',
    'kelas': 'B',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Rabu',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Dasar',
    'kelas': 'C',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Kamis',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Dasar',
    'kelas': 'D',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Selasa',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Sistem Linier',
    'kelas': 'A',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Senin',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Sistem Linier',
    'kelas': 'B',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Rabu',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Sistem Linier',
    'kelas': 'C',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Kamis',
    'jam': '08:45-10:30',
    'kodeMK': 'CIF61009',
    'namaMK': 'Sistem Linier',
    'kelas': 'D',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Senin',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Lanjut',
    'kelas': 'A',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Selasa',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Lanjut',
    'kelas': 'B',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Rabu',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Lanjut',
    'kelas': 'C',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Kamis',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Pemograman Lanjut',
    'kelas': 'D',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Senin',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Etika Profesi',
    'kelas': 'A',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Selasa',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Etika Profesi',
    'kelas': 'B',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Rabu',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Etika Profesi',
    'kelas': 'C',
    'sks': '4',
    'peminat': '0/30',
  },
  {
    'tahun_kurikulum': '2020',
    'hari': 'Kamis',
    'jam': '11:45-12:30',
    'kodeMK': 'CCE61208',
    'namaMK': 'Etika Profesi',
    'kelas': 'D',
    'sks': '4',
    'peminat': '0/30',
  },
];
