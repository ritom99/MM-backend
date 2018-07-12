<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {
 	public function homepage() {
 		$data['pagetitle'] = 'Homepage';
 		$data['latest_posts'] = $this->post_model->get_latest_posts();
 		$data['featured_posts'] = $this->post_model->get_featured_posts();
 		$data['editors_picks'] = $this->post_model->get_editors_picks();
 		$data['pictures'] = $this->post_model->get_pictures();
  		
  		$this->load->view('templates/header', $data);
    	$this->load->view('pages/homepage', $data);
  	}


	public function pictures() {
		$data['pagetitle'] = 'Pictures';
		$data['pictures'] = $this->post_model->get_pictures();

		$this->load->view('templates/header', $data);
		$this->load->view('pages/picturespage.php', $data);
	}

	public function sports(){
		$data['pagetitle'] = 'Sports';
		$data['most_recent'] = $this->post_model->get_latest_posts($category = 'Sports', $mostrecent = TRUE);
		$data['latest_posts'] = $this->post_model->get_latest_posts($category = 'Sports');

		$this->load->view('templates/header', $data);
		$this->load->view('pages/sports', $data);
	}

	public function businessandtech(){
		$data['pagetitle'] = 'businessandtech';
		$data['most_recent'] = $this->post_model->get_latest_posts($category = 'Business and Tech', $mostrecent = TRUE);
		$data['latest_posts'] = $this->post_model->get_latest_posts($category = 'Business and Tech');

		$this->load->view('templates/header', $data);
		$this->load->view('pages/bt', $data);
	}

	public function forum($id = NULL) {
		if ($id == NULL) {
			$data['pagetitle'] = 'Forum';
			$data['posts'] = $this->post_model->get_forum_posts($id);
		
			$this->load->view('templates/header', $data);
			$this->load->view('pages/forum', $data);
		}

		else {
			$data['pagetitle'] = FALSE;
			$data['post'] = $this->post_model->get_forum_posts($id);
			$data['comments'] = $this->post_model->get_forum_thread($id);

			$this->load->view('templates/header', $data);
			$this->load->view('articles/threadview', $data);
		}
	}

	/*public function forumthread($slug = NULL) {
		$data['pagetitle'] = FALSE;
		$data['post'] = $this->post_model->get_forum_posts($slug);
		$data['thread'] = $this->post

	}*/

	public function articles($slug = NULL) {
		$data['pagetitle'] = FALSE;
		$data['post'] = $this->post_model->get_posts($slug);
		$data['comments'] = $this->post_model->get_comments('approved', $data['post']['id']);

		if(empty($data['post'])) {
			show_404();
		}
  		
  		$this->load->view('templates/header', $data);
    	$this->load->view('articles/view', $data);
	}

	public function askaquestion() {
		$data['pagetitle'] = 'Ask a question';
		$data['questions'] = $this->post_model->get_questions();

		$this->load->view('templates/header', $data);
		$this->load->view('pages/askaq', $data);
	}

}

?>
