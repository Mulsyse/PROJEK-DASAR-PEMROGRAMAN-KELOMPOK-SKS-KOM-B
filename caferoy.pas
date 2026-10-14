program SistemPemesananRoyCafe;
uses crt;

const
  gb     = '==================================================';
  gt     = '|------------------------------------------------|';
  kosong = '|                                                |';

var
  { Jumlah pesanan per menu (pengganti array) }
  q1, q2, q3, q4, q5, q6, q7, q8, q9, q10,
  q11, q12, q13, q14, q15, q16, q17, q18, q19, q20 : integer;

  pilihan, jumlah, pilihanAkhir, nomor, pd, kode : integer;
  hg, subtotal, total, bayar, kembalian : longint;
  nm, inp : string;
  ulangSistem, transaksiSelesai, selesaiPesanItem, adaError : boolean;

begin
  { ---------------- LAYAR SAMBUTAN ---------------- }
  clrscr;
  writeln(gb);
  writeln(kosong);
  writeln('|', '':16, 'R O Y   C A F E', '':17, '|');
  writeln('|', '':11, 'Coffee - Food - Good Vibes', '':11, '|');
  writeln(kosong);
  writeln(gt);
  writeln('|', '':7, 'Selamat Datang di Sistem Pemesanan', '':7, '|');
  writeln(gb);
  writeln;
  write('Tekan Enter untuk mulai...');
  readln;

  ulangSistem := true;

  while ulangSistem do
  begin
    { Reset keranjang pesanan }
    q1 := 0;  q2 := 0;  q3 := 0;  q4 := 0;  q5 := 0;
    q6 := 0;  q7 := 0;  q8 := 0;  q9 := 0;  q10 := 0;
    q11 := 0; q12 := 0; q13 := 0; q14 := 0; q15 := 0;
    q16 := 0; q17 := 0; q18 := 0; q19 := 0; q20 := 0;

    transaksiSelesai := false;

    repeat

      { ===== FASE 1: PILIH MENU DAN JUMLAH ===== }
      selesaiPesanItem := false;
      repeat

        { --- 1. Pilih menu --- }
        adaError := false;
        repeat
          clrscr;
          writeln(gb);
          writeln('|', '':14, 'DAFTAR MENU ROY CAFE', '':14, '|');
          writeln(gb);
          writeln('| ', '--- MAKANAN ---', '':32, '|');
          writeln('| ', 1:2,  '. Chicken Steak',       '':6, 'Rp ', 35000:6, '':15, '|');
          writeln('| ', 2:2,  '. Beef Burger',         '':8, 'Rp ', 32000:6, '':15, '|');
          writeln('| ', 3:2,  '. Chicken Burger',      '':5, 'Rp ', 28000:6, '':15, '|');
          writeln('| ', 4:2,  '. Spaghetti Bolognese',       'Rp ', 30000:6, '':15, '|');
          writeln('| ', 5:2,  '. Carbonara Pasta',     '':4, 'Rp ', 32000:6, '':15, '|');
          writeln('| ', 6:2,  '. Chicken Katsu Rice',  '':1, 'Rp ', 28000:6, '':15, '|');
          writeln('| ', 7:2,  '. Beef Teriyaki Rice',  '':1, 'Rp ', 30000:6, '':15, '|');
          writeln('| ', 8:2,  '. Chicken Wings',       '':6, 'Rp ', 25000:6, '':15, '|');
          writeln('| ', 9:2,  '. French Fries',        '':7, 'Rp ', 18000:6, '':15, '|');
          writeln('| ', 10:2, '. Fish & Chips',        '':7, 'Rp ', 35000:6, '':15, '|');
          writeln(gt);
          writeln('| ', '--- MINUMAN ---', '':32, '|');
          writeln('| ', 11:2, '. Ice Americano',       '':6, 'Rp ', 18000:6, '':15, '|');
          writeln('| ', 12:2, '. Cafe Latte',          '':9, 'Rp ', 22000:6, '':15, '|');
          writeln('| ', 13:2, '. Cappuccino',          '':9, 'Rp ', 22000:6, '':15, '|');
          writeln('| ', 14:2, '. Caramel Macchiato',   '':2, 'Rp ', 25000:6, '':15, '|');
          writeln('| ', 15:2, '. Matcha Latte',        '':7, 'Rp ', 24000:6, '':15, '|');
          writeln('| ', 16:2, '. Chocolate Frappe',    '':3, 'Rp ', 25000:6, '':15, '|');
          writeln('| ', 17:2, '. Strawberry Smoothie',       'Rp ', 23000:6, '':15, '|');
          writeln('| ', 18:2, '. Iced Lemon Tea',      '':5, 'Rp ', 15000:6, '':15, '|');
          writeln('| ', 19:2, '. Fresh Orange Juice',  '':1, 'Rp ', 18000:6, '':15, '|');
          writeln('| ', 20:2, '. Mineral Water',       '':6, 'Rp ', 7000:6,  '':15, '|');
          writeln(gt);
          if adaError then
            writeln('| ERROR: Input harus angka 1-20, bukan huruf!', '':4, '|');
          writeln(gb);

          write('Pilih nomor menu (1-20): ');
          readln(inp);
          val(inp, pilihan, kode);

          if (kode <> 0) or (pilihan < 1) or (pilihan > 20) then
            adaError := true
          else
            adaError := false;
        until not adaError;

        { Ambil nama, harga, dan jumlah spasi pelengkap (pd = 19 - panjang nama) }
        case pilihan of
          1  : begin nm := 'Chicken Steak';       hg := 35000; pd := 6; end;
          2  : begin nm := 'Beef Burger';         hg := 32000; pd := 8; end;
          3  : begin nm := 'Chicken Burger';      hg := 28000; pd := 5; end;
          4  : begin nm := 'Spaghetti Bolognese'; hg := 30000; pd := 0; end;
          5  : begin nm := 'Carbonara Pasta';     hg := 32000; pd := 4; end;
          6  : begin nm := 'Chicken Katsu Rice';  hg := 28000; pd := 1; end;
          7  : begin nm := 'Beef Teriyaki Rice';  hg := 30000; pd := 1; end;
          8  : begin nm := 'Chicken Wings';       hg := 25000; pd := 6; end;
          9  : begin nm := 'French Fries';        hg := 18000; pd := 7; end;
          10 : begin nm := 'Fish & Chips';        hg := 35000; pd := 7; end;
          11 : begin nm := 'Ice Americano';       hg := 18000; pd := 6; end;
          12 : begin nm := 'Cafe Latte';          hg := 22000; pd := 9; end;
          13 : begin nm := 'Cappuccino';          hg := 22000; pd := 9; end;
          14 : begin nm := 'Caramel Macchiato';   hg := 25000; pd := 2; end;
          15 : begin nm := 'Matcha Latte';        hg := 24000; pd := 7; end;
          16 : begin nm := 'Chocolate Frappe';    hg := 25000; pd := 3; end;
          17 : begin nm := 'Strawberry Smoothie'; hg := 23000; pd := 0; end;
          18 : begin nm := 'Iced Lemon Tea';      hg := 15000; pd := 5; end;
          19 : begin nm := 'Fresh Orange Juice';  hg := 18000; pd := 1; end;
          20 : begin nm := 'Mineral Water';       hg := 7000;  pd := 6; end;
        end;

        { --- 2. Input jumlah --- }
        adaError := false;
        repeat
          clrscr;
          writeln(gb);
          writeln('|', '':14, 'INPUT JUMLAH PESANAN', '':14, '|');
          writeln(gb);
          writeln('| Menu Dipilih : ', nm, '':(pd + 13), '|');
          writeln('| Harga Satuan : Rp ', hg:7, '':22, '|');
          writeln(gt);
          if adaError then
            writeln('| ERROR: Jumlah harus angka lebih dari 0!', '':8, '|');
          writeln(gb);

          write('Masukkan jumlah pesanan: ');
          readln(inp);
          val(inp, jumlah, kode);

          if (kode <> 0) or (jumlah <= 0) then
            adaError := true
          else
            adaError := false;
        until not adaError;

        { Simpan pesanan }
        case pilihan of
          1  : q1  := q1  + jumlah;
          2  : q2  := q2  + jumlah;
          3  : q3  := q3  + jumlah;
          4  : q4  := q4  + jumlah;
          5  : q5  := q5  + jumlah;
          6  : q6  := q6  + jumlah;
          7  : q7  := q7  + jumlah;
          8  : q8  := q8  + jumlah;
          9  : q9  := q9  + jumlah;
          10 : q10 := q10 + jumlah;
          11 : q11 := q11 + jumlah;
          12 : q12 := q12 + jumlah;
          13 : q13 := q13 + jumlah;
          14 : q14 := q14 + jumlah;
          15 : q15 := q15 + jumlah;
          16 : q16 := q16 + jumlah;
          17 : q17 := q17 + jumlah;
          18 : q18 := q18 + jumlah;
          19 : q19 := q19 + jumlah;
          20 : q20 := q20 + jumlah;
        end;
        subtotal := hg * jumlah;

        { --- 3. Tambah item lagi? (hanya Y atau T) --- }
        adaError := false;
        repeat
          clrscr;
          writeln(gb);
          writeln('|', '':17, 'STATUS PESANAN', '':17, '|');
          writeln(gb);
          writeln('| Berhasil menambahkan: ', nm, '':(pd + 6), '|');
          writeln('| Jumlah        : ', jumlah:5, '':26, '|');
          writeln('| Subtotal Item : Rp ', subtotal:10, '':18, '|');
          writeln(gt);
          if adaError then
            writeln('| ERROR: Masukkan huruf Y atau T saja!', '':11, '|');
          writeln(gb);

          write('Tambah item menu lain? (Y/T): ');
          readln(inp);

          if (inp = 'Y') or (inp = 'y') or (inp = 'T') or (inp = 't') then
            adaError := false
          else
            adaError := true;
        until not adaError;

        if (inp = 'T') or (inp = 't') then
          selesaiPesanItem := true;

      until selesaiPesanItem;

      { ===== FASE 2: RINGKASAN PESANAN ===== }
      adaError := false;
      repeat
        clrscr;
        writeln(gb);
        writeln('|', '':15, 'RINGKASAN PESANAN', '':16, '|');
        writeln(gb);
        writeln('| No  Nama Menu', '':10, 'Harga':7, 'Qty':4, 'Subtotal':10, '':3, '|');
        writeln(gt);

        total := 0;
        nomor := 0;
        if q1 > 0 then begin nomor := nomor + 1; subtotal := 35000 * q1; total := total + subtotal; writeln('| ', nomor:2, '. Chicken Steak',       '':6, 35000:7, q1:4,  subtotal:10, '':3, '|'); end;
        if q2 > 0 then begin nomor := nomor + 1; subtotal := 32000 * q2; total := total + subtotal; writeln('| ', nomor:2, '. Beef Burger',         '':8, 32000:7, q2:4,  subtotal:10, '':3, '|'); end;
        if q3 > 0 then begin nomor := nomor + 1; subtotal := 28000 * q3; total := total + subtotal; writeln('| ', nomor:2, '. Chicken Burger',      '':5, 28000:7, q3:4,  subtotal:10, '':3, '|'); end;
        if q4 > 0 then begin nomor := nomor + 1; subtotal := 30000 * q4; total := total + subtotal; writeln('| ', nomor:2, '. Spaghetti Bolognese',       30000:7, q4:4,  subtotal:10, '':3, '|'); end;
        if q5 > 0 then begin nomor := nomor + 1; subtotal := 32000 * q5; total := total + subtotal; writeln('| ', nomor:2, '. Carbonara Pasta',     '':4, 32000:7, q5:4,  subtotal:10, '':3, '|'); end;
        if q6 > 0 then begin nomor := nomor + 1; subtotal := 28000 * q6; total := total + subtotal; writeln('| ', nomor:2, '. Chicken Katsu Rice',  '':1, 28000:7, q6:4,  subtotal:10, '':3, '|'); end;
        if q7 > 0 then begin nomor := nomor + 1; subtotal := 30000 * q7; total := total + subtotal; writeln('| ', nomor:2, '. Beef Teriyaki Rice',  '':1, 30000:7, q7:4,  subtotal:10, '':3, '|'); end;
        if q8 > 0 then begin nomor := nomor + 1; subtotal := 25000 * q8; total := total + subtotal; writeln('| ', nomor:2, '. Chicken Wings',       '':6, 25000:7, q8:4,  subtotal:10, '':3, '|'); end;
        if q9 > 0 then begin nomor := nomor + 1; subtotal := 18000 * q9; total := total + subtotal; writeln('| ', nomor:2, '. French Fries',        '':7, 18000:7, q9:4,  subtotal:10, '':3, '|'); end;
        if q10 > 0 then begin nomor := nomor + 1; subtotal := 35000 * q10; total := total + subtotal; writeln('| ', nomor:2, '. Fish & Chips',       '':7, 35000:7, q10:4, subtotal:10, '':3, '|'); end;
        if q11 > 0 then begin nomor := nomor + 1; subtotal := 18000 * q11; total := total + subtotal; writeln('| ', nomor:2, '. Ice Americano',       '':6, 18000:7, q11:4, subtotal:10, '':3, '|'); end;
        if q12 > 0 then begin nomor := nomor + 1; subtotal := 22000 * q12; total := total + subtotal; writeln('| ', nomor:2, '. Cafe Latte',          '':9, 22000:7, q12:4, subtotal:10, '':3, '|'); end;
        if q13 > 0 then begin nomor := nomor + 1; subtotal := 22000 * q13; total := total + subtotal; writeln('| ', nomor:2, '. Cappuccino',          '':9, 22000:7, q13:4, subtotal:10, '':3, '|'); end;
        if q14 > 0 then begin nomor := nomor + 1; subtotal := 25000 * q14; total := total + subtotal; writeln('| ', nomor:2, '. Caramel Macchiato',   '':2, 25000:7, q14:4, subtotal:10, '':3, '|'); end;
        if q15 > 0 then begin nomor := nomor + 1; subtotal := 24000 * q15; total := total + subtotal; writeln('| ', nomor:2, '. Matcha Latte',        '':7, 24000:7, q15:4, subtotal:10, '':3, '|'); end;
        if q16 > 0 then begin nomor := nomor + 1; subtotal := 25000 * q16; total := total + subtotal; writeln('| ', nomor:2, '. Chocolate Frappe',    '':3, 25000:7, q16:4, subtotal:10, '':3, '|'); end;
        if q17 > 0 then begin nomor := nomor + 1; subtotal := 23000 * q17; total := total + subtotal; writeln('| ', nomor:2, '. Strawberry Smoothie',       23000:7, q17:4, subtotal:10, '':3, '|'); end;
        if q18 > 0 then begin nomor := nomor + 1; subtotal := 15000 * q18; total := total + subtotal; writeln('| ', nomor:2, '. Iced Lemon Tea',      '':5, 15000:7, q18:4, subtotal:10, '':3, '|'); end;
        if q19 > 0 then begin nomor := nomor + 1; subtotal := 18000 * q19; total := total + subtotal; writeln('| ', nomor:2, '. Fresh Orange Juice',  '':1, 18000:7, q19:4, subtotal:10, '':3, '|'); end;
        if q20 > 0 then begin nomor := nomor + 1; subtotal := 7000 * q20;  total := total + subtotal; writeln('| ', nomor:2, '. Mineral Water',       '':6, 7000:7,  q20:4, subtotal:10, '':3, '|'); end;

        writeln(gt);
        writeln('| TOTAL HARGA : Rp ', total:10, '':20, '|');
        writeln(gt);
        writeln('| Menu Pilihan Akhir:', '':28, '|');
        writeln('|   [1] Pesan lagi', '':31, '|');
        writeln('|   [2] Lanjut ke pembayaran', '':21, '|');
        writeln('|   [3] Keluar', '':35, '|');
        if adaError then
        begin
          writeln(gt);
          writeln('| ERROR: Masukkan angka 1, 2, atau 3!', '':12, '|');
        end;
        writeln(gb);

        write('Pilih menu (1-3): ');
        readln(inp);
        val(inp, pilihanAkhir, kode);

        if (kode <> 0) or (pilihanAkhir < 1) or (pilihanAkhir > 3) then
          adaError := true
        else
          adaError := false;
      until not adaError;

      { ===== FASE 3: EKSEKUSI PILIHAN AKHIR ===== }
      if pilihanAkhir = 1 then
        transaksiSelesai := false;

      if pilihanAkhir = 2 then
      begin
        { --- Pembayaran --- }
        adaError := false;
        repeat
          clrscr;
          writeln(gb);
          writeln('|', '':19, 'PEMBAYARAN', '':19, '|');
          writeln(gb);
          writeln('| Total Tagihan : Rp ', total:10, '':18, '|');
          if adaError then
          begin
            writeln(gt);
            writeln('| ERROR: Harus angka & tidak kurang dari tagihan!', '|');
          end;
          writeln(gb);

          write('Uang bayar (Rp): ');
          readln(inp);
          val(inp, bayar, kode);

          if (kode <> 0) or (bayar < total) then
            adaError := true
          else
            adaError := false;
        until not adaError;

        kembalian := bayar - total;

        { --- Struk --- }
        clrscr;
        writeln(gb);
        writeln('|', '':10, 'STRUK PEMBAYARAN - ROY CAFE', '':11, '|');
        writeln(gb);
        writeln('| No  Nama Menu', '':10, 'Harga':7, 'Qty':4, 'Subtotal':10, '':3, '|');
        writeln(gt);

        nomor := 0;
        if q1 > 0 then begin nomor := nomor + 1; subtotal := 35000 * q1; writeln('| ', nomor:2, '. Chicken Steak',       '':6, 35000:7, q1:4,  subtotal:10, '':3, '|'); end;
        if q2 > 0 then begin nomor := nomor + 1; subtotal := 32000 * q2; writeln('| ', nomor:2, '. Beef Burger',         '':8, 32000:7, q2:4,  subtotal:10, '':3, '|'); end;
        if q3 > 0 then begin nomor := nomor + 1; subtotal := 28000 * q3; writeln('| ', nomor:2, '. Chicken Burger',      '':5, 28000:7, q3:4,  subtotal:10, '':3, '|'); end;
        if q4 > 0 then begin nomor := nomor + 1; subtotal := 30000 * q4; writeln('| ', nomor:2, '. Spaghetti Bolognese',       30000:7, q4:4,  subtotal:10, '':3, '|'); end;
        if q5 > 0 then begin nomor := nomor + 1; subtotal := 32000 * q5; writeln('| ', nomor:2, '. Carbonara Pasta',     '':4, 32000:7, q5:4,  subtotal:10, '':3, '|'); end;
        if q6 > 0 then begin nomor := nomor + 1; subtotal := 28000 * q6; writeln('| ', nomor:2, '. Chicken Katsu Rice',  '':1, 28000:7, q6:4,  subtotal:10, '':3, '|'); end;
        if q7 > 0 then begin nomor := nomor + 1; subtotal := 30000 * q7; writeln('| ', nomor:2, '. Beef Teriyaki Rice',  '':1, 30000:7, q7:4,  subtotal:10, '':3, '|'); end;
        if q8 > 0 then begin nomor := nomor + 1; subtotal := 25000 * q8; writeln('| ', nomor:2, '. Chicken Wings',       '':6, 25000:7, q8:4,  subtotal:10, '':3, '|'); end;
        if q9 > 0 then begin nomor := nomor + 1; subtotal := 18000 * q9; writeln('| ', nomor:2, '. French Fries',        '':7, 18000:7, q9:4,  subtotal:10, '':3, '|'); end;
        if q10 > 0 then begin nomor := nomor + 1; subtotal := 35000 * q10; writeln('| ', nomor:2, '. Fish & Chips',       '':7, 35000:7, q10:4, subtotal:10, '':3, '|'); end;
        if q11 > 0 then begin nomor := nomor + 1; subtotal := 18000 * q11; writeln('| ', nomor:2, '. Ice Americano',       '':6, 18000:7, q11:4, subtotal:10, '':3, '|'); end;
        if q12 > 0 then begin nomor := nomor + 1; subtotal := 22000 * q12; writeln('| ', nomor:2, '. Cafe Latte',          '':9, 22000:7, q12:4, subtotal:10, '':3, '|'); end;
        if q13 > 0 then begin nomor := nomor + 1; subtotal := 22000 * q13; writeln('| ', nomor:2, '. Cappuccino',          '':9, 22000:7, q13:4, subtotal:10, '':3, '|'); end;
        if q14 > 0 then begin nomor := nomor + 1; subtotal := 25000 * q14; writeln('| ', nomor:2, '. Caramel Macchiato',   '':2, 25000:7, q14:4, subtotal:10, '':3, '|'); end;
        if q15 > 0 then begin nomor := nomor + 1; subtotal := 24000 * q15; writeln('| ', nomor:2, '. Matcha Latte',        '':7, 24000:7, q15:4, subtotal:10, '':3, '|'); end;
        if q16 > 0 then begin nomor := nomor + 1; subtotal := 25000 * q16; writeln('| ', nomor:2, '. Chocolate Frappe',    '':3, 25000:7, q16:4, subtotal:10, '':3, '|'); end;
        if q17 > 0 then begin nomor := nomor + 1; subtotal := 23000 * q17; writeln('| ', nomor:2, '. Strawberry Smoothie',       23000:7, q17:4, subtotal:10, '':3, '|'); end;
        if q18 > 0 then begin nomor := nomor + 1; subtotal := 15000 * q18; writeln('| ', nomor:2, '. Iced Lemon Tea',      '':5, 15000:7, q18:4, subtotal:10, '':3, '|'); end;
        if q19 > 0 then begin nomor := nomor + 1; subtotal := 18000 * q19; writeln('| ', nomor:2, '. Fresh Orange Juice',  '':1, 18000:7, q19:4, subtotal:10, '':3, '|'); end;
        if q20 > 0 then begin nomor := nomor + 1; subtotal := 7000 * q20;  writeln('| ', nomor:2, '. Mineral Water',       '':6, 7000:7,  q20:4, subtotal:10, '':3, '|'); end;

        writeln(gt);
        writeln('| Total Tagihan : Rp ', total:10, '':18, '|');
        writeln('| Uang Bayar    : Rp ', bayar:10, '':18, '|');
        writeln('| Kembalian     : Rp ', kembalian:10, '':18, '|');
        writeln(gt);
        writeln('|', '':17, 'STATUS : LUNAS', '':17, '|');
        writeln('|', '':3, 'Terima kasih telah berbelanja di ROY CAFE!', '':3, '|');
        writeln('|', '':6, 'Sampai jumpa lagi,selamat menikmati!', '':6, '|');
        writeln(gb);
        writeln;
        write('Tekan Enter untuk keluar...');
        readln;

        transaksiSelesai := true;
        ulangSistem := false;
      end;

      if pilihanAkhir = 3 then
      begin
        clrscr;
        writeln(gb);
        writeln(kosong);
        writeln('|', '':16, 'R O Y   C A F E', '':17, '|');
        writeln('|', '':3, 'Terima kasih telah berkunjung ke ROY CAFE!', '':3, '|');
        writeln('|', '':7, 'Kami tunggu kedatanganmu kembali.', '':8, '|');
        writeln(kosong);
        writeln(gb);
        writeln;
        write('Tekan Enter untuk keluar...');
        readln;

        transaksiSelesai := true;
        ulangSistem := false;
      end;

    until transaksiSelesai;

  end;
end.