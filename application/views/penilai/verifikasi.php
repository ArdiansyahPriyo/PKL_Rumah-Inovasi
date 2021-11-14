<div class="container-fluid">

        <?php
        $id_user    = $this->session->userdata('id_usr'); 
        $sql = $this->db->query("SELECT * FROM setting_penilai where id_usr ='$id_user'")->result(); 
        if (!$sql) {
          redirect('penilai/data_verifikasi/kosong');
        }else {?>
        <td><div class="form-row align-items-center">
            <div class="col-auto my-1">
              <select class="custom-select mr-sm-2" name="cari_verifikasi" id="myInput2" onkeyup="filter_tahun2()">
                <option disabled selected>Pilih Tahun</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
              </select>
            </div>
            <div class="col-auto my-1">
              <button type="submit" onclick="filter_tahun2()" class="btn btn-sm btn-primary btn-icon-split">
                  <span class="icon text-white-50">
                    <i class="fas fa-search"></i>
                  </span>
                  <span class="text">Filter</span>
              </button>
            </div>
          </div>
        </td>

      <div class="card shadow mb-4">
      <div
          class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">DATA VERIFIKASI</h6>
      </div>
      <div class="card-body">
        <?php echo $this->session->flashdata('message');  ?>
        <div class="table-responsive">
        <table id="myTable2" class="table table-striped" style="width: 100%">
          <tr>
            <th class="text-center table-secondary">No</th>
            <th class="table-secondary">Tahun</th>
            <th class="table-secondary">Sub Event</th>
            <th class="table-secondary">Nama Inovasi</th>
            <th class="table-secondary">Inovator</th>
            <th class="text-center table-secondary" colspan="2">Aksi</th>
          </tr>

         <?php 
          $no=1;
          foreach($usulan as $usl) : ?>
            <tr>
              <td class="text-center"><?php echo $no++ ?></td>
              <td><?php echo $usl->tahun ?></td>
              <td><?php echo $usl->subevent ?></td>
              <td><?php echo $usl->judul ?></td>
              <td><?php echo $usl->user ?></td>
              <td align="center" style="width: 50"><?php echo anchor('penilai/data_verifikasi/view/' .$usl->id, '<div class="btn btn-sm btn-warning btn"><i class="fa fa-search-plus"></i> Lihat</div>') ?>
              </td>

              <td align="center" style="width: 50">
                <div class="form-group row">  
                    <?php echo anchor('penilai/data_verifikasi/nilai_verifikasi/' .$usl->id, '<div class="btn btn-sm btn-primary "><i class="fa fa-edit"></i> Nilai</div>') ?>  
                    <?php foreach ($ganti_warna as $warna): ?>
                      <?php if($warna->id_usulan == $usl->id): ?>
                        <button style="position: absolute;" class="btn btn-sm btn-secondary" disabled="" ><i class="fa fa-edit"> Nilai</i></button>
                      <?php endif; ?>
                    <?php endforeach ?>
                </div>
              </td>
            </tr>
          <?php endforeach; ?> 

          </table>
        </div>
      </div>
  </div>
<?php } ?>
    
    
    </div>
<script>
function filter_tahun2() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput2");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable2");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    




