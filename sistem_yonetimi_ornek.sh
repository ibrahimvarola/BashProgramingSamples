#İbrahim Varola tarafından oluşturulmuştur ve düzenlenmiştir.

#!/usr/bin/env bash

clear

kullanicilar=(hyuce ibrahimvarola berkant)
kullanici_sifre=(1234 abcd asdf)
kullanici_seviye=(1 1 1)
degisken1=0
secenek=0
kullanici_adi_tanimlama() {
	echo -n "Tanımlayacağınız kullanıcının adını giriniz: "
	read yeni_kullanici
	kullanicilar=("${kullanicilar[@]}" "$yeni_kullanici")
}

kullanici_sifresi_belirleme() {
	echo -n "Tanımlamış olduğunuz $yeni_kullanici kullanıcısının şifresini belirleyiniz : "
	read -s yeni_kullanici_sifre ; echo "                      "
        echo -n "Şifreyi tekrar giriniz :"
      while [ 1 ] ; do
  read -s sifre_dogrulama ; echo "                        "
      if [ "$sifre_dogrulama" == "$yeni_kullanici_sifre" ] ; then
	kullanici_sifre=("${kullanici_sifre[@]}" "$yeni_kullanici_sifre")
       echo "İşleminiz başarıyla gerçekleştirilmiştir"
               break
     else
       echo -n "Şifreyi yanlış girdiniz lütfen tekrar deneyiniz :"
    fi
done

}

yeni_kullanici_seviyesi_belirleme() {
while [ 1 ]
do
echo -n "Tanımlamış olduğunuz $yeni_kullanici kullanıcısının seviyesini belirleyiniz(0 ya da 1): "
read yeni_kullanici_seviye
if [ $yeni_kullanici_seviye -le 1 ]
	then
		kullanici_seviye=("${kullanici_seviye[@]}" "$yeni_kullanici_seviye")
		echo "Kullanıcı $yeni_kullanici sisteme başarıyla tanımlandı!"
		break
else
	echo "Yanlış değer girdiniz, lütfen tekrar deneyiniz."
fi
done
}

kullanici_seviyesi_belirleme() {
while [ 1 ]
do
read -p "Seçmiş olduğunuz ${kullanicilar[$secenek1]} kullanıcısının seviyesini giriniz(1 - 0): "
done
}


user_root() {
   while [ 1 ] 
   do
   echo "-----------------------------------------------------------------------"

   echo "1- Yeni kullanıcı tanımlama"
   echo "2- Kullanıcı seviyesi belirleme"
   echo "3- Kullanıcı şifresi değiştirme-belirleme"
   echo "4- Kullanıcı bilgilerini görüntüleme"
   echo "5- Çıkış"

   echo -n "İşleminizi giriniz: "
   read islem

   case $islem in
	1)
		echo "-----------------------------------------------------------------------"

		kullanici_adi_tanimlama
	
		kullanici_sifresi_belirleme
	
		yeni_kullanici_seviyesi_belirleme

		
	   ;;
	2)
		clear
		while [ 1 ]
		do
		echo "-----------------------------------------------------------------------"
		degisken1=0
		kullanici_sayisi=${#kullanicilar[*]}
		
		while [ $degisken1 -lt $kullanici_sayisi ]
		do
    	echo "$((degisken1+1))- ${kullanicilar[$degisken1]}"
    	degisken1=$((degisken1+1))
		done
		

		echo -n "Lütfen değişiklik yapmak istediğiniz kullanıcının sahip olduğu numarayı seçiniz: "
		read secenek

		if [ $secenek -gt $((degisken1)) ]
			then
				echo "Yanlış seçenek seçtiniz, lütfen tekrar deneyiniz."
		else
			kullanici_seviyesi_belirleme
			break
		fi
		done
	  ;;
	3)
		echo "Yapım Aşamasında!"
	  ;;
	5)
		exit
	  ;;
	4)
	echo "-----------------------------------------------------------------------"
                degisken1=0
		kullanici_sayisi=${#kullanicilar[*]} #kullanicilar dizisinde bulunan elemanların sayisini kullanici_sayisi degiskenine atadı
		
		
	while [ $degisken1 -le $kullanici_sayisi ]
		do
            if [ "$degisken1" -eq "0" -a "$kullanici_sayisi" -eq "0" ] ; then
                echo "Sistemde kullanıcı yoktur"
                   break
      else
    	echo "kad = ${kullanicilar[$degisken1]} ksif= ${kullanici_sifre[$degisken1]} ksev= ${kullanici_seviye[$degisken1]}"
    	degisken1=$((degisken1+1))
           if [ $degisken1 == $kullanici_sayisi ] ; then
                break
   fi
           fi
        done
		;;
	*)
	  echo "Yanlış seçenek numarası girdiniz, tekrar deneyiniz."
	;;
   esac
done

}
user_user() {
   echo "1- Kullanıcı bilgilerini görüntüle"

   echo -n "İşleminizi giriniz: "
   read islem
}

user_root #YAPIM ASAMASINDA OLDUGU ICIN FONKSIYONU DIREK CAGIRIYORUM
#Yapılan düzeltmeler
#seçeneklere 5 eklendiz ve 4 ile değiştirildi
#şifre koyarken doğrulama eklendi
#sistemde kullanıcı yok iken 4 işleminde kullanıcı yok ibaresi eklendi
#kullanıcılara berkant eklendi :)
#diziden eleman silmeyi öğrenmeliyiz
