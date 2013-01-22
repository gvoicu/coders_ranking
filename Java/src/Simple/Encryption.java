package Simple;

import java.security.MessageDigest;

public class Encryption {
    public static String crypt(String text) throws Exception{
        StringBuffer sb = new StringBuffer();
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte [] v = text.getBytes();

        md.reset();
        md.update(v);
        byte [] digest = md.digest();
        for(int i=0; i<digest.length; i++) {
            sb.append(Integer.toHexString(0xFF & digest[i]));
        }
        return sb.toString();
    }
}
