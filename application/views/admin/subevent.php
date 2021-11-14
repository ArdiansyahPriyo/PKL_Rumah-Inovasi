<div class="container-fluid">

    <a href="#" class="btn btn-sm btn-primary btn-icon-split mb-3" data-toggle="modal" data-target="#tambah_subevent">
      <span class="icon text-white-50">
        <i class="fas fa-plus"></i>
      </span>
      <span class="text">Tambah Sub Event</span>
    </a>

   
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div
          class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">DATA SUB EVENT</h6>
      </div>
      <!-- Card Body -->
      <div class="card-body">
        <?php echo $this->session->flashdata('message');  ?>
          <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <tr>
              <th class="table-secondary">No</th>
              <th class="table-secondary">Tahun</th>
              <th class="table-secondary">Event</th>
              <th class="table-secondary">Sub Event</th>
              <th class="table-secondary">Bidang</th>
              <th class="table-secondary">Tanggal Mulai</th>
              <th class="table-secondary">Tanggal Berakhir</th>
              <th class="text-center table-secondary">Aksi</th>
            </tr>

            <?php 
            $no=1;
            foreach($subevent as $sbevt) : ?>

            <tr>
              <td><?php echo $no++ ?></td>
              <td><?php echo $sbevt->tahun ?></td>
              <td><?php echo $sbevt->event ?></td>
              <td><?php echo $sbevt->subevent ?></td>
              <td><?php echo $sbevt->bidang ?></td>
              <td><?php echo $sbevt->mulai ?></td>
              <td><?php echo $sbevt->akhir ?></td>
              <td align="center" style="width: 50"><?php echo anchor('admin/data_subevent/edit/' .$sbevt->id, '<div class="btn btn-sm btn-primary btn"><i class="fa fa-edit"></i> Edit</div>') ?></td>
            </tr>
          <?php endforeach; ?>
        </table>
      </div>
    </div>
  </div>
    
</div>

<!-- Modal -->
<div class="modal fade" id="tambah_subevent" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Tambah Sub Event</h5>
      </div>
      <div class="modal-body">
        <form action="<?php echo base_url(). 'admin/data_subevent/tambah_subevent'; ?>" method="post" enctype="multipart/form-data" >

          <div class="form-group row ml-1">
            <dt class="mr-4 text-size 25">Tahun</dt>
            <input type="text" name="tahun" style="position: absolute; left: 138px; width: 60%" class="form-control col-sm-8 ml-3" value="<?php echo date("Y") ?>" readonly>
          </div><br>

          <div class="form-group row ml-1">
            <dt class="mr-1">Event</dt>
            <select class="form-control col-sm-8 ml-3" name="id_event" style="position: absolute; left: 138px; width: 60%">
               <?php foreach($list_event as $evt) : ?>
                <option value="<?php echo $evt->id ?>">
                  <?php echo $evt->event ?>
                </option>
               <?php endforeach; ?>
            </select>
          </div><br>

          <div class="form-group row ml-1">
            <dt class="mr-4 text-size 25">Sub Event</dt>
            <input type="text" name="subevent" style="position: absolute; left: 138px; width: 60%" class="form-control col-sm-8 ml-3" required oninvalid="this.setCustomValidity('Data wajib diisi!')" oninput="setCustomValidity('')">
          </div><br>

          <div class="form-group row ml-1">
            <dt class="mr-4 text-size 25">Bidang</dt>
            <input type="text" name="bidang" style="position: absolute; left: 138px; width: 60%" class="form-control col-sm-8 ml-3" required oninvalid="this.setCustomValidity('Data wajib diisi!')" oninput="setCustomValidity('')">
          </div><br>

          <div class="form-group row ml-1">
            <dt class="mr-3">Tanggal Mulai</dt>
            <input type="date" name="mulai" id="tgl_mulai" style="position: absolute; left: 130px; width: 60%" class="form-control datepicker col-sm-8 ml-4" required oninvalid="this.setCustomValidity('Data wajib diisi!')" oninput="setCustomValidity('')" min="09-20-2001" onclick="tanggal()">
          </div><br>



          <div class="form-group row ml-1">
            <dt class="mr-3">Tanggal Berakhir</dt>
            <input type="date" name="akhir" id="tgl_akhir" style="position: absolute; left: 130px; width: 60%" class="form-control datepicker col-sm-8 ml-4" required oninvalid="this.setCustomValidity('Data wajib diisi!')" oninput="setCustomValidity('')" min="2010-10-10" onclick="tanggal()">
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




<script type="text/javascript">

    function tanggal(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd
        } 
        if(mm<10){
            mm='0'+mm
        } 

    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById("tgl_mulai").value;
   
    var ambiltgl = document.getElementById('tgl_mulai').value;  
    var tod = new Date(ambiltgl);
    var d = tod.getDate()+1;
    var m = tod.getMonth()+1; //January is 0!
    var y = tod.getFullYear();
     if(d<10){
            d='0'+d
        } 
        if(m<10){
            m='0'+m
        } 

    tod = y+'-'+m+'-'+d;
    document.getElementById("tgl_akhir").setAttribute("min", tod);
 }

  </script>