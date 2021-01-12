package com.hsw.util;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

/**
 * @ClassName AesUtil
 * @Description TODO
 * @Author huangshengwen
 * @Date 2021/1/12 11:10
 * @Version 1.0
 **/

public class AesUtil {
    private final String IV = "98516D446AF418112933CC64F9A98C05";
    private final String SALT = "1D2F0B381038C6E1";
    private final int keySize = 128;
    private final int iterationCount = 1;
    private static AesUtil util = new AesUtil();

    private AesUtil() {
    }

    public static AesUtil getInstance() {
        return util;
    }

    public String encrypt(String content, String key) {
        String encrypt = util.encrypt("1D2F0B381038C6E1", "98516D446AF418112933CC64F9A98C05", key, content);
        return hex(base64(encrypt));
    }

    public String decrypt(String cipherText, String key) {
        cipherText = base64(hex(cipherText));
        String decrypt = util.decrypt("1D2F0B381038C6E1", "98516D446AF418112933CC64F9A98C05", key, cipherText);
        return decrypt;
    }

    private String encrypt(String salt, String iv, String passphrase, String plaintext) {
        try {
            SecretKey key = this.generateKey(salt, passphrase);
            byte[] encrypted = this.doFinal(1, key, iv, plaintext.getBytes("UTF-8"));
            return base64(encrypted);
        } catch (UnsupportedEncodingException var7) {
            throw this.fail(var7);
        }
    }

    private String decrypt(String salt, String iv, String passphrase, String ciphertext) {
        try {
            SecretKey key = this.generateKey(salt, passphrase);
            byte[] decrypted = this.doFinal(2, key, iv, base64(ciphertext));
            return new String(decrypted, "UTF-8");
        } catch (UnsupportedEncodingException var7) {
            throw this.fail(var7);
        }
    }

    private byte[] doFinal(int encryptMode, SecretKey key, String iv, byte[] bytes) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(encryptMode, key, new IvParameterSpec(hex(iv)));
            return cipher.doFinal(bytes);
        } catch (InvalidKeyException var6) {
            throw this.fail(var6);
        } catch (InvalidAlgorithmParameterException var7) {
            throw this.fail(var7);
        } catch (IllegalBlockSizeException var8) {
            throw this.fail(var8);
        } catch (BadPaddingException var9) {
            throw this.fail(var9);
        } catch (Exception var10) {
            throw this.fail(var10);
        }
    }

    private SecretKey generateKey(String salt, String passphrase) {
        try {
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            KeySpec spec = new PBEKeySpec(passphrase.toCharArray(), hex(salt), 1, 128);
            SecretKey key = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
            return key;
        } catch (NoSuchAlgorithmException var6) {
            throw this.fail(var6);
        } catch (InvalidKeySpecException var7) {
            throw this.fail(var7);
        }
    }

    private static String base64(byte[] bytes) {
        try {
            return new String(Base64.encodeBase64(bytes), "UTF-8");
        } catch (UnsupportedEncodingException var2) {
            var2.printStackTrace();
            return null;
        }
    }

    private static byte[] base64(String str) {
        return Base64.decodeBase64(str.getBytes());
    }

    private static String hex(byte[] bytes) {
        return new String(Hex.encodeHex(bytes));
    }

    private static byte[] hex(String str) {
        try {
            return Hex.decodeHex(str.toCharArray());
        } catch (DecoderException var2) {
            throw new IllegalStateException(var2);
        }
    }

    private IllegalStateException fail(Exception e) {
        return new IllegalStateException(e);
    }
}

