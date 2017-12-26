<?php
class ControllerExtensionFeedNewsblogSitemapYandex extends Controller {
	public function index() {
		if ($this->config->get('newsblog_sitemap_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

			$this->load->model('newsblog/article');

			$articles = $this->model_newsblog_article->getArticles();

			foreach ($articles as $article) {
					$output .= '<url>';
					$output .= '<loc>' . $this->url->link('newsblog/article', 'newsblog_article_id=' . $article['article_id']) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($article['date_modified'])) . '</lastmod>';
					$output .= '<priority>1.0</priority>';
					$output .= '</url>';
					$output .= "\n";
			}

			$this->load->model('newsblog/category');

			$output .= $this->getCategories(0);

			$output .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}

	protected function getCategories($parent_id, $current_path = '') {
		$output = '';

		$results = $this->model_newsblog_category->getCategories($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

			$output .= '<url>';
			$output .= '<loc>' . $this->url->link('newsblog/category', 'newsblog_path=' . $new_path) . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.7</priority>';
			$output .= '</url>';

			$output .= $this->getCategories($result['category_id'], $new_path);
		}

		return $output;
	}
}
