module MantaFilesHelper
  def file_icon(file_obj)
    if file_obj.is_a?(MantaDir)
      "folder outline"
    elsif file_obj.is_a?(MantaFile)
      "file outline"
    end
  end
  def manta_breadcrumbs(full_path)
    root = "/#{current_manta_account.manta_username}/stor"
    if full_path == root
      link_to root, manta_files_path, class: 'active section'
    else
      crumbs = ''
      crumbs << "#{link_to root, manta_files_path, class: 'section'}"
      remaining_path = full_path.gsub(root, '')
      remaining_path.split("/")[1..-1].each_with_index do |dir, i|
        crumbs << "<div class='divider'> / </div>"
        dir_target_path = manta_files_path(path: root + remaining_path.split('/')[0..i+1].join("/"))
        crumbs << "#{link_to dir, dir_target_path, class: ('section active' if remaining_path.split("/")[-1] == dir ) }"
      end
      crumbs.html_safe
    end
  end
end
