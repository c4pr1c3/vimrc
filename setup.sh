#!/usr/bin/env bash

set -e

if [[ ! "$(lsb_release -i -s 2>/dev/null)" =~ Ubuntu|Kali ]];then
   read -r -p "This script SHOULD ONLY be run on Ubuntu or Kali, run at your own RISK: (y/n)" agree
   if [[ ! "$agree" =~ y|Y ]];then
     exit 1
   fi
   agree=''
else
  export DEBIAN_FRONTEND=noninteractive
fi

if [[ $EUID -eq 0 ]]; then
   read -r -p "This script SHOULD NOT be run as root, run at your own RISK: (y/n)" agree
   if [[ ! "$agree" =~ y|Y ]];then
     exit 1
   fi
fi

VIM_UNDO_DIR="${HOME}/.vim/_undodir"

sh_deps=(
"shellcheck"
)

pyenv_deps=(
"make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl"
)

ycm_deps=(
"build-essential cmake python3-dev"
)

other_deps=(
"ctags"
"unzip"
"global" # gtags
)

deb_deps=(
"vim-nox"
"${sh_deps[@]}"
"${pyenv_deps[@]}"
"${ycm_deps[@]}"
"${other_deps[@]}"
)

PY_VERSION="3.6.8"

# 可选依赖

optional_deps=(
"sdcv" # 星际译王 cli 版
)

# 星际译王使用的字典文件
stardict_url="https://github.com/skywind3000/ECDICT/releases/download/1.0.28/ecdict-stardict-28.zip"
stardict_md5="b6176fa7d97502cfaac90bf390ea3761"

STARDICT_DIR="${HOME}/.stardict"
STARDICT_FILE="${STARDICT_DIR}/ecdict-stardict-28.zip"
STARDICT_DIR_DONE="${STARDICT_DIR}/stardict-ecdict-2.4.2"

PYENV_REPO="https://github.com/pyenv/pyenv.git"
export PYENV_ROOT="${HOME}/.pyenv"

pip_deps=(
"jedi"
"flake8"
"pygments"
)

# 必要依赖安装
last_update=$(stat -c %Y /var/cache/apt/pkgcache.bin)
now=$(date +%s)
if [ $((now - last_update)) -gt 3600 ]; then
  sudo apt-get update
fi

# shellcheck disable=SC2128 disable=SC2086 disable=SC2068
sudo apt install -y ${deb_deps[@]} $optional_deps

# 安装 pyenv
echo "[+] pyenv install"
if cd "${PYENV_ROOT}"; then git pull; else git clone "${PYENV_REPO}" "${PYENV_ROOT}"; fi

# shellcheck disable=SC2016
grep -q 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bashrc || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# shellcheck disable=SC2016
grep -q 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bashrc || echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# shellcheck disable=SC2016
grep -q 'if command -v pyenv 1>/dev/null 2>&1; then' ~/.bashrc || echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

export PATH="${PYENV_ROOT}/bin:${PATH}"
echo "$PATH"
pyenv_bin="${PYENV_ROOT}/libexec/pyenv"
eval "$(${pyenv_bin} init -)"

# 输入 3. 之后连按 2 次 TAB 可以自动补全当前可用的 python 版本
# 添加编译参数是为了后续能正常编译 YCM 插件
export PY_VERSION
if ! ${pyenv_bin} local $PY_VERSION >/dev/null 2>&1 ;then
PYTHON_CONFIGURE_OPTS="--enable-shared" "${pyenv_bin}" install -v $PY_VERSION
# 在系统全局启用刚才安装的 python
"${pyenv_bin}" rehash && "${pyenv_bin}" global $PY_VERSION
fi

# 安装 SyntasticCheck 依赖的相关外部程序
for pkg in "${pip_deps[@]}";do
  [[ $(pip show "$pkg") ]] || pip install "$pkg"
done

[[ -d "$VIM_UNDO_DIR" ]] || mkdir -p "$VIM_UNDO_DIR"

if [[ -f "$STARDICT_FILE" ]];then
  if [[ -d "${STARDICT_DIR_DONE}" ]];then
    exit 0
  fi
else
  curl -fLo "$STARDICT_FILE" --create-dirs "$stardict_url" 
fi

if [[ $(md5sum -b "${STARDICT_FILE}" | cut -d ' ' -f 1) == "${stardict_md5}" ]];then
  unzip "$STARDICT_FILE" -d "${STARDICT_DIR}"
fi

echo "Now, it's time to open vim for the first time!"
echo "vim-plug will finish installing the remaining vim plugins"
echo "source ~/.bashrc && vim"

ln -snf "${HOME}/.vim/vimrc" "${HOME}/.vimrc"

