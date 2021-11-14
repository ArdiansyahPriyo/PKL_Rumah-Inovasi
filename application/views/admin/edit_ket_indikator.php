<div class="container-fluid">
	
	<form action="<?php echo base_url('admin/data_inovasi/detail')?>" method="post">
  		<?php foreach ($keterangan_indikator as $ketind) : ?>
		<input type="text" hidden name="back" value="<?php echo $ketind->id_indikator_penilaian ?>">
		<button class="btn btn-sm btn-warning mb-3"><i class="fas fa-arrow-left"></i> Kembali</button>
		<?php endforeach; ?>
	</form>
	
	<div class="card shadow mb-4">
      <h5 class="card-header"><b><i class="fas fa-edit"></i> Edit Data Keterangan Indikator</b> </h5>	
      <div class="card-body">
			<div class="row">
            <div class="col-md-12">
					<table class="table">
						<?php foreach ($keterangan_indikator as $ketind) : ?>
							<form method="post" action="<?php echo base_url().'admin/data_inovasi/update' ?>">
								<div class= "row">
									<dt for="inputNama" class="col-sm-2 col-form-label">Keterangan</dt>
										<div class="col-sm-5 mb-3">
											<input type="hidden" name="id_keterangan_indikator" class="form-control" value="<?php echo $ketind->id_keterangan_indikator ?>">
											<input type="hidden" name="id_indikator_penilaian" class="form-control" value="<?php echo $ketind->id_indikator_penilaian ?>">	
											<input type="text" name="keterangan" class="form-control" value="<?php echo $ketind->keterangan ?>" required>
										</div>
								</div>

								<div class= "row">
									<dt for="inputNama" class="col-sm-2 col-form-label">Nilai Minimal</dt>
										<div class="col-sm-5 mb-3">
											<input type="text" name="nilai_minimal" class="form-control" value="<?php echo $ketind->nilai_minimal_keterangan ?>" required>
										</div>
								</div>

								<div class= "row">
									<dt for="inputNama" class="col-sm-2 col-form-label">Nilai Maksimal</dt>
										<div class="col-sm-5 mb-3">
											<input type="text" name="nilai_maksimal" class="form-control" value="<?php echo $ketind->nilai_maksimal_keterangan ?>" required>
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