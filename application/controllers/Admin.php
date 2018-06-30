<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	function __construct() {
		parent::__construct();
		$this->load->library('form_validation');
	}

	public function index() {
		/*$username = $this->input->post()*/
		$this->load->view('admin/login');
	}

	public function login() {
		$this->form_validation->set_rules('username','Username','trim|required');
		$this->form_validation->set_rules('password','Password','trim|required');
		if ($this->form_validation->run() === FALSE) {
			$this->load->view('admin/login');
		}
		else {
			$user = array(
			'username'=>$this->input->post('username'),
			'password'=>md5($this->input->post('password'))
		);

			$data = $this->users_model->login_user($user['username'], $user['password']);
			if ($data['role'] == 'admin') {
				$this->session->set_userdata('id', $data['id']);
				$this->session->set_userdata('username', $data['username']);
				$this->session->set_userdata('email', $data['email']);
				$this->session->set_userdata('role', $data['role']);
				$this->session->set_userdata('logged_in', TRUE);
				$this->session->set_flashdata('msg_success','Login Successful!');

				redirect(site_url('Admin/panel'));
			}

			else {
				$this->session->set_flashdata('error_msg', "Invalid Username/Password!");
				$this->load->view('admin/login');
			}
		}
	}

	public function panel() {
		if ($this->session->userdata('logged_in') == TRUE) {
			$data['posts'] = $this->post_model->get_posts();
			$data['pics'] = $this->post_model->get_pictures();

			$this->load->view('admin/adminpanel', $data);
		}
		else {
			redirect('Admin/index');
		}
	}

	public function logout() {
		$this->session->sess_destroy();
		redirect('Admin/index');
	}

	public function add() {
			$title = $this->input->post('title');
			$category = $this->input->post('category');
			$slug = $this->input->post('slug');
			$image = $this->input->post('image');
			$info = $this->input->post('info');
			$date = $this->input->post('date');
			$author = $this->input->post('author');
			$body = $this->input->post('body');

		$this->post_model->add_posts($title, $category, $slug, $image, $info, $date, $author, $body);
		redirect('Admin/panel');
	}

	public function addpic() {
			$title = $this->input->post('title');
			$image = $this->input->post('image');
			$info = $this->input->post('info');
			$date = $this->input->post('date');

		$this->post_model->add_pics($title, $image, $info, $date);
		redirect('Admin/panel');
	}


	/*public function view_post($id) {	//editpost
		$data['post'] = $this->post_model->get_post($id);
		redirect $data;
	}*/

	public function delete($id) {
		$this->post_model->delete_post($id);
		redirect('Admin/panel');
	}

	public function deletepic($id) {
		$this->post_model->delete_pic($id);
		redirect('Admin/panel');
	}

	public function editpost($id) {
		$title = $this->input->post('title');
		$category = $this->input->post('category');
		$slug = $this->input->post('slug');
		$image = $this->input->post('image');
		$info = $this->input->post('info');
		$date = $this->input->post('date');
		$author = $this->input->post('author');
		$body = $this->input->post('body');

		$this->post_model->edit_post($id, $title, $category, $slug, $image, $info, $date, $author, $body);
		redirect('Admin/panel');

	}

}

?>