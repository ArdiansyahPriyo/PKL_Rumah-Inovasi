<?php 

class Model_usulan extends CI_Model{
	public function tampil_data(){
		$this->db->select('*');
			$this->db->from('usulan');
			$this->db->where('status', 2);
			$this->db->or_where('status', 3);
			$query = $this->db->get();
			return $query->result();
	} 

	public function nilai_proposal(){
		$this->db->select('*');
			$this->db->from('penilaian_proposal');
			$query = $this->db->get();
			return $query->result();
	} 

	public function tampil_data2(){
		$user =  $this->session->userdata('email');
		$result = $this->db->get_where('usulan', array('penilai' => $user));
		if($result->num_rows() >= 0){
			return $result->result();
		} else {
			return false;
		}
	} 

	/*public function tampil_data2(){
		$this->db->select('*')
		     ->from('usulan')
		     ->join('list_items', 'list_items.list_id = lists.id') 
		     ->where('list_id', $id);

		$query = $this->db->get();
	} */
	public function tambah_riwayat($data,$table){
		$this->db->insert($table,$data);
	}
	public function edit_riwayat($where,$table){
		return $this->db->get_where($table,$where);
	}
	public function update_riwayat($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}
	public function hapus_riwayat($where,$table)
	{
		$this->db->where($where);
		$this->db->delete($table);
	}
}
