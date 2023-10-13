#!/bin/bash

Install_composer() {
  if [ -e "${php_install_dir}/bin/phpize" ]; then
    if [ -e "/usr/local/bin/composer" ]; then
      echo "${CWARNING}PHP Composer already installed! ${CEND}"
    else
      pushd ${oneinstack_dir}/src > /dev/null

      wget --no-check-certificate -c https://getcomposer.org/composer.phar -O /usr/local/bin/composer > /dev/null 2>&1
      chmod +x /usr/local/bin/composer
      if [ -e "/usr/local/bin/composer" ]; then
        echo; echo "${CSUCCESS}PHP Composer installed successfully! ${CEND}"
      else
        echo; echo "${CFAILURE}PHP Composer install failed, Please try again! ${CEND}"
      fi
      popd > /dev/null
    fi
  fi
}

Uninstall_composer() {
  if [ -e "/usr/local/bin/composer" ]; then
    rm -f /usr/local/bin/composer
    echo; echo "${CMSG}Composer uninstall completed${CEND}";
  else
    echo; echo "${CWARNING}Composer does not exist! ${CEND}"
  fi
}
