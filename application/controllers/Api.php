<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
	public function echo_json($response) {
		$data['json_response'] = json_encode($response);
		$this->load->view('api/api',$data);
	}

	public function getfeaturedposts() {
		$featuredposts = $this->post_model->get_featured_posts();
		$this->echo_json($featuredposts);
	}

	public function getposts() {
		$posts = $this->post_model->get_posts();
		$this->echo_json($posts);
	}

	public function gettabposts($tab, $lim = NULL) {
		$tabposts = $this->post_model->get_tab_posts($tab, $lim);
		$this->echo_json($tabposts);
	}

	public function getpost($id) {
		$post = $this->post_model->get_posts(FALSE, $id);
		$this->echo_json($post);
	}

	public function getlatestpost() {
		$post = $this->post_model->get_latest_posts(FALSE, TRUE);
		$this->echo_json($post);
	}

	public function getcomments($id) {
		$comments = $this->post_model->get_comments('all', $id);
		$this->echo_json($comments);
	}

}

?>
