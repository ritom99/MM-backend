<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	function __construct() {
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->library('upload');
	}

	public function index() {
		/*$username = $this->input->post()*/
		if (!$this->session->userdata('logged_in') == TRUE) {
			$this->load->view('admin/login');
		} else {
			$this->load->view('admin/panel');
		}
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
			$data['forumposts'] = $this->post_model->get_forum_posts(NULL);
			$data['threads'] = $this->post_model->get_forum_thread(NULL);
			$data['a_comments'] = $this->post_model->get_comments('approved', NULL);
			$data['na_comments'] = $this->post_model->get_comments('notapproved', NULL);
			$data['u_questions'] = $this->post_model->get_questions(TRUE);
			$data['a_questions'] = $this->post_model->get_questions();
			$data['error'] = '';

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
		$slug = url_title($title);
		$info = $this->input->post('info');
		$author = $this->input->post('author');
		$body = $this->input->post('body');

		$config['upload_path'] = './images/';
		$config['allowed_types'] = 'gif|jpg|png|jpeg';
		$config['max_size']    = '16777215';
        $config['max_width']  = '3000';
        $config['max_height']  = '3000';
	    $this->upload->initialize($config);

	    if ($this->upload->do_upload('userfile')) {
        	$image = $this->upload->data('file_name');
        	/*$image = $image_data['file_name'];*/


		$this->post_model->add_posts($title, $category, $slug, $image, $info, $author, $body);
		redirect('Admin/panel');
		}

		else {
			$error = array('error' => $this->upload->display_errors());
			$this->load->view('admin/adminpanel', $error);		}

	}

	public function addpic() {
		$title = $this->input->post('title');
		$info = $this->input->post('info');

		$config['upload_path'] = './images/';
		$config['allowed_types'] = 'gif|jpg|png|jpeg';
		$config['max_size']    = '16777215';
        $config['max_width']  = '3000';
        $config['max_height']  = '3000';
	    $this->upload->initialize($config);

	    if ($this->upload->do_upload('userfile')) {
        	$image = $this->upload->data('file_name');
        	/*$image = $image_data['file_name'];*/


		$this->post_model->add_pics($title, $image, $info);
		redirect('Admin/panel');
		}
	}


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
		$info = $this->input->post('info');
		$author = $this->input->post('author');
		$body = $this->input->post('body');

		$config['upload_path'] = './images/';
		$config['allowed_types'] = 'gif|jpg|png|jpeg';
		$config['max_size']    = '16777215';
        $config['max_width']  = '3000';
        $config['max_height']  = '3000';
	    $this->upload->initialize($config);

	    if ($this->upload->do_upload('userfile')) {
        	$image = $this->upload->data('file_name');
        	/*$image = $image_data['file_name'];*/


		$this->post_model->edit_post($id, $title, $category, $image, $info, $author, $body);
		redirect('Admin/panel');
		}

		else {
			$this->post_model->edit_post($id, $title, $category, $image=NULL, $info, $author, $body);
			redirect('Admin/panel');
		}

	}

	public function addforumpost() {
		$title = $this->input->post('title');
		$date = $this->input->post('date');
		$content = $this->input->post('content');
		$user = $this->session->userdata('username');

		$this->post_model->add_forum_post($user, $date, $title, $content);
		redirect('Main/forum');
	}

	public function addforumcomment($id) {
		$comment = $this->input->post('comment');
		$user = $this->session->userdata('username');

		$this->post_model->add_forum_comment($id, $user, $comment);
		redirect('Main/forum/'.$id);

	}

	public function deleteforumpost($id) {
		$this->post_model->delete_forum_post($id);
		redirect('Admin/panel');
	}

	public function deleteforumthread($id) {
		$this->post_model->delete_forum_thread($id);

		redirect('Admin/panel');
	}

	public function addcomment($id) {
		$comment = $this->input->post('comment');
		$user = $this->session->userdata('username');
		$data['post'] = $this->post_model->get_post($id);

		$this->post_model->add_comment($id, $user, $comment);
		redirect('Main/articles/'.$data['post']['slug']);
	}

	public function approvecomment($id) {
		$this->post_model->approve_comment($id);

		redirect('Admin/panel');
	}

	public function deletecomment($id) {
		$this->post_model->delete_comment($id);

		redirect('Admin/panel');
	}

	public function askaq() {
		$question = $this->input->post('question');
		$this->post_model->ask_a_question($question);
		$this->session->set_flashdata('question_success', 'Your question has been successfully submitted!');

		redirect('Main/askaquestion');
	}

	public function deletequestion($id) {
		$this->post_model->delete_q($id);

		redirect('Admin/panel');
	}

	public function addanswer($id) {
		$answer = $this->input->post('answer');
		$this->post_model->add_answer($id, $answer);

		redirect('Admin/panel');
	}

}

?>