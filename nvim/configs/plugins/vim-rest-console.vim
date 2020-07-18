" === Vim REST Console === "

" For debugging
let g:vrc_show_command = 0

" let b:vrc_response_default_content_type = 'application/json'

let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}

