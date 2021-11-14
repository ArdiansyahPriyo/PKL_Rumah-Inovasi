<div class="container-fluid">
	
	<form action="<?php echo base_url('admin/data_inovasi/indikator')?>" method="post">
  		<?php foreach ($indikator_penilaian as $id_pen) : ?>
		<input type="text" hidden name="id_back" value="<?php echo $id_pen->id_subevent ?>">
		<button class="btn btn-sm btn-warning mb-3"><i class="fas fa-arrow-left"></i> Kembali</button>
		<?php endforeach; ?>
	</form>
	
	<div class="card shadow mb-4">
      <h5 class="card-header"><b><i class="fas fa-edit"></i> Edit Data Indikator Inovasi</b> </h5>	
      <div class="card-body">
			<div class="row">
            <div class="col-md-12">
					<table class="table">
						<?php foreach ($indikator_penilaian as $id_pen) : ?>
							<form method="post" action="<?php echo base_url().'admin/data_inovasi/update_indikator' ?>">
								<div class= "row">
									<dt for="inputNama" class="col-sm-2 col-form-label">Keterangan</dt>
										<div class="col-sm-5 mb-3">
											<input type="hidden" name="id_indikator_penilaian" class="form-control" value="<?php echo $id_pen->id_indikator_penilaian ?>">
											<input type="hidden" name="id_subevent" class="form-control" value="<?php echo $id_pen->id_subevent ?>">	
											<input type="text" name="indikator" class="form-control" value="<?php echo $id_pen->indikator ?>" required>
										</div>
								</div>

								

								<button type="submit" class="btn btn-primary btn-sm mt-3 mr-2"> Simpan</button>
								
							</form>
						<?php endforeach; ?>
					</table>
            </div>
         </div>
     </div>
   </div>
</div>