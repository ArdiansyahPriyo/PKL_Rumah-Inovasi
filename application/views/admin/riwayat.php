<div class="container-fluid">

   <!--  <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#tambah_event"><i class="fas fa-plus fa-sm"></i> Tambah Event</button> -->
   <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div
          class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">DATA RIWAYAT</h6>
      </div>
      <!-- Card Body -->
      <div class="card-body">
        <?php echo $this->session->flashdata('message');  ?>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <tr>
              <th class="text-center table-secondary">No</th>
              <th class="table-secondary">Tahun</th>
              <!-- <th class="table-secondary">Event</th> -->
              <th class="table-secondary">Sub Event</th>
               <th class="table-secondary">Inovator</th>
              <th class="table-secondary">Nama Inovasi</th>
              <th class="table-secondary">Status</th>    
              <th class="text-center table-secondary" colspan="2">Aksi</th>
            </tr>

            <?php 
            $no=1;
            foreach($usulan as $usl) : ?>

            <tr>
              <td class="text-center"><?php echo $no++ ?></td>
              <td><?php echo $usl->tahun ?></td>
              <td><?php echo $usl->subevent ?></td>
              <td><?php echo $usl->user ?></td>
              <td><?php echo $usl->judul ?></td>
             <!--  <td><?php echo $usl->status ?></td> -->
             <td><?php if ($usl->status == '1')
                    {echo'Melengkapi Data';}
                elseif ($usl->status == '2')
                  {echo'Sedang Dinilai';} 
                elseif ($usl->status == '3')
                  {echo'Selesai';}?></td>

              <?php $id_usulan = $usl->id;?>
              <?php $sql = $this->db->query("SELECT * FROM penilaian_proposal where id_usulan='$id_usulan'")->result(); ?>
              <?php if ($sql) :?>
              <td align="center" style="width: 50"><div class="btn btn-sm btn-secondary disabled btn"><i class="fa fa-edit"></i> Edit</div></td>
              <?php else: ?>
              <td align="center" style="width: 50"><?php echo anchor('admin/data_riwayat/edit/' .$usl->id, '<div class="btn btn-sm btn-primary btn"><i class="fa fa-edit"></i> Edit</div>') ?></td>
              <?php endif;?>
              <td align="center" style="width: 50"><?php echo anchor('admin/data_riwayat/view/' .$usl->id, '<div class="btn btn-sm btn-warning btn"><i class="fa fa-search-plus"></i> View</div>') ?></td>
              </div></td>
            </tr>

          <?php endforeach; ?>
        </table>
      </div>
      </div>
  </div>    
</div>

<!-- Modal -->
<div class="modal fade" id="tambah_event" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Tambah Event</h5>
      </div>
      <div class="modal-body">
        <form action="<?php echo base_url(). 'admin/data_event/tambah_event'; ?>" method="post" enctype="multipart/form-data" >

          <div class="form-group row ml-4">
            <dt class="mr-4 text-size 25">Nama Event</dt>
            <input type="text" name="event" style="position: absolute; left: 138px; width: 60%" class="form-control col-sm-8 ml-3">
          </div><br>
        </div>

        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Simpan</button>
          <a href="<?php echo base_url('admin/data_event') ?>"><div class="btn btn-secondary">Batal</div></a>
        </div>

        </form>

    </div>
  </div>
</div>

<div class="modal fade" id="hapus_event" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Hapus Data</h5>
      </div>
      <div class="modal-body">
        <p>Apakah Anda yakin akan menghapus data ini?</p>

        <div class="modal-footer">
          <?php echo anchor('admin/data_event/hapus/' .$evt->id, '<div class="btn btn-danger btn">Hapus</div>') ?>
          <a href="<?php echo base_url('admin/data_event') ?>"><div class="btn btn-secondary">Batal</div></a>
        </div>
    </div>
  </div>
</div>
<!-- Modal -->
