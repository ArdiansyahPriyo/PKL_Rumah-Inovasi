<div class="container-fluid">
	
	<div>
		<?php foreach($jumlah_penilai as $nm) : ?>
			<?php if ($nm->id <= 6) { ?>
				<button class="btn btn-primary btn-sm btn-icon-split mb-4" data-toggle="modal" data-target="#tambah_penilai">
		      <span class="icon text-white-50">
		        <i class="fas fa-plus"></i>
		      </span>
		      <span class="text">Tambah Penilai</span>
		    </button>
			<?php }else{ ?>
				<button type="button" class="btn btn-primary btn-sm btn-icon-split mb-4" data-toggle="modal" data-target="#tambah_gagal">
		      <span class="icon text-white-50">
		        <i class="fas fa-plus"></i>
		      </span>
		      <span class="text">Tambah Penilai</span>
		    </button>
		  <?php } ?>
  <?php endforeach; ?>
		<!-- <button class="btn btn-sm btn-primary mb-4" data-toggle="modal" data-target="#tambah_penilai"><i class="fas fa-plus fa-sm"></i> Tambah Penilai</button> -->
		<a href="<?php echo base_url('admin/data_penilai/') ?>"><div class="btn btn-sm btn-warning mb-4">Kembali</div></a>
	</div>

	<div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div
          class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Sub Event : <?php echo $subevent->subevent ?></h6>
      </div>
      <!-- Card Body -->
      <div class="card-body">
        <?php echo $this->session->flashdata('message1');  ?>
				<?php echo $this->session->flashdata('hapus_penilai');  ?>
				<div class="table-responsive">
				<table class="table table-bordered table-hover">
					
					<tr>
						<th class="text-center table-secondary" style="width: 10%;">No</th>
						<th class="text-center table-secondary">Nama Penilai</th>
						<th class="text-center table-secondary">Email</th>
						<th class="text-center table-secondary" style="width: 15%;">Aksi</th>
					</tr>

					<?php  
					$no=1;
				      foreach($nama_penilai as $setpnl) : ?>

				      <tr>
				        <td align="center"><?php echo $no++ ?></td>
					 			<td align="center"><?php echo $setpnl->nama ?></td>
					 			<td align="center"><?php echo $setpnl->email ?></td>
					 			<td align="center" style="width: 50"> <div class="btn btn-sm btn-danger btn" data-toggle="modal" data-target="#hapus_penilai<?php echo $setpnl->id ?>"><i class="fa fa-trash"></i> <a>Hapus</a></div></td>
						 </tr>
						 <div class="modal fade" id="hapus_penilai<?php echo $setpnl->id?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title"  id="exampleModalLabel">Hapus Data</h5>
							      </div>
							      <div class="modal-body">
							        <p>Apakah Anda yakin akan menghapus data ini?</p>
							        
							        		<form enctype="multipart/form-data" method="post" action="<?php echo base_url('admin/data_penilai/hapus/') ?>">
							        			<div hidden="">
									        		id_user<input value="<?php echo $setpnl->id_usr?>" type="text" name="id_user"><br>
									        		id_penilai<input value="<?php echo $setpnl->id?>" type="text" name="id_penilai">
							        			</div>
							        			<div align="right">
									        		<button type="submit" class="mr-2 btn btn-primary" style="width:20%;">Iya</button>
							          			<button type="button" class="ml-2 btn btn-secondary" style="width:20%;" data-dismiss="modal">Batal</button>
									        	</div>
									        </form>
							    </div>
							  </div>
							</div>
					<?php endforeach; ?>
			 
				</table>
      </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="tambah_penilai" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Tambah Penilai</h5>
      </div>
      <div class="modal-body">
        <form action="<?php echo base_url(). 'admin/data_penilai/tambah_penilai/'; ?>" method="post" enctype="multipart/form-data" >

          <div class="form-group row ml-4">
            <dt class="mr-4 text-size 25">Sub Event</dt>
            <input type="text" name="subevent" style="position: absolute; left: 138px; width: 60%" class="form-control col-sm-8 ml-3" value="<?php echo $subevent->subevent ?>" readonly>
            <input type="text" name="id_subevent" style="position: absolute; left: 138px; width: 60%" class="form-control col-sm-8 ml-3" value="<?php echo $subevent->id ?>" hidden>
            
          </div><br>

          <div class="form-group row ml-4">
            <dt class="mr-1">Penilai</dt>
            <select class="form-control col-sm-8 ml-3" name="id_usr" style="position: absolute; left: 138px; width: 60%">
            <?php foreach($list_penilai as $nilai) : ?>
							<option value="<?php echo $nilai->id_usr ?>">
							<?php echo $nilai->nama ?>
						</option>
						<?php endforeach; ?>
						</select>
          </div><br>

	      </div>

	      <div class="modal-footer">
	      	
	        <button type="submit" class="btn btn-primary">Simpan</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
	        
	      </div>
      	</form>
    </div>
  </div>
</div>

<div class="modal fade" id="tambah_gagal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-primary"  id="exampleModalLabel"><i class="fas fa-info-circle "></i> Informasi</h5>
      </div>
      <div class="modal-body">
        <p>Data penilai sudah mencapai batas maksimal !</p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Oke</button>
      </div>
    </div>
  </div>
</div>

<!-- <div class="modal fade" id="hapus_penilai" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Hapus Data</h5>
      </div>
      <div class="modal-body">
        <p>Apakah Anda yakin akan menghapus data ini?</p>

        <div class="modal-footer">
          <?php echo anchor('admin/data_penilai/hapus/' .$setpnl->id,   '<div class="btn btn-danger btn">Hapus</div>') ?>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        </div>
    </div>
  </div>
</div>
</div>
 -->


