// To parse this JSON data, do
//
//     final matkul = matkulFromJson(jsonString);





class Matkul {
    Matkul({
        this.id,
        this.kelas,
        this.programStudi,
        this.kode,
        this.mataKuliah,
        this.tahunKurikulum,
        this.sks,
        this.tipe,
        this.waktuJadwalUser,
    });

    int? id;
    String? kelas;
    String? programStudi;
    String? kode;
    String? mataKuliah;
    String? tahunKurikulum;
    int? sks;
    String? tipe;
    List<WaktuJadwalUser>? waktuJadwalUser;

    factory Matkul.fromJson(Map<String, dynamic> json) => Matkul(
        id: json["ID"],
        kelas: json["Kelas"],
        programStudi: json["ProgramStudi"],
        kode: json["Kode"],
        mataKuliah: json["MataKuliah"],
        tahunKurikulum: json["TahunKurikulum"],
        sks: json["Sks"],
        tipe: json["Tipe"],
        waktuJadwalUser: List<WaktuJadwalUser>.from(json["WaktuJadwalUser"].map((x) => WaktuJadwalUser.fromJson(x))),
    );

    
}

class WaktuJadwalUser {
    WaktuJadwalUser({
        this.id,
        this.jadwalDariUserId,
        this.hari,
        this.jamMulai,
        this.jamAkhir,
    });

    int? id;
    int? jadwalDariUserId;
    int? hari;
    String? jamMulai;
    String? jamAkhir;

    factory WaktuJadwalUser.fromJson(Map<String, dynamic> json) => WaktuJadwalUser(
        id: json["ID"],
        jadwalDariUserId: json["JadwalDariUserID"],
        hari: json["Hari"],
        jamMulai: json["JamMulai"],
        jamAkhir: json["JamAkhir"],
    );


}
