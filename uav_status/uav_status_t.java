/* LCM type definition class file
 * This file was automatically generated by lcm-gen
 * DO NOT MODIFY BY HAND!!!!
 */

package uav_status;
 
import java.io.*;
import java.util.*;
import lcm.lcm.*;
 
public final class uav_status_t implements lcm.lcm.LCMEncodable
{
    public long timestamp;
    public double position[];
    public double orientation[];
    public int mode;
    public long send_count;
 
    public uav_status_t()
    {
        position = new double[3];
        orientation = new double[4];
    }
 
    public static final long LCM_FINGERPRINT;
    public static final long LCM_FINGERPRINT_BASE = 0x07fc94516d3598fbL;
 
    static {
        LCM_FINGERPRINT = _hashRecursive(new ArrayList<Class<?>>());
    }
 
    public static long _hashRecursive(ArrayList<Class<?>> classes)
    {
        if (classes.contains(uav_status.uav_status_t.class))
            return 0L;
 
        classes.add(uav_status.uav_status_t.class);
        long hash = LCM_FINGERPRINT_BASE
            ;
        classes.remove(classes.size() - 1);
        return (hash<<1) + ((hash>>63)&1);
    }
 
    public void encode(DataOutput outs) throws IOException
    {
        outs.writeLong(LCM_FINGERPRINT);
        _encodeRecursive(outs);
    }
 
    public void _encodeRecursive(DataOutput outs) throws IOException
    {
        outs.writeLong(this.timestamp); 
 
        for (int a = 0; a < 3; a++) {
            outs.writeDouble(this.position[a]); 
        }
 
        for (int a = 0; a < 4; a++) {
            outs.writeDouble(this.orientation[a]); 
        }
 
        outs.writeInt(this.mode); 
 
        outs.writeLong(this.send_count); 
 
    }
 
    public uav_status_t(byte[] data) throws IOException
    {
        this(new LCMDataInputStream(data));
    }
 
    public uav_status_t(DataInput ins) throws IOException
    {
        if (ins.readLong() != LCM_FINGERPRINT)
            throw new IOException("LCM Decode error: bad fingerprint");
 
        _decodeRecursive(ins);
    }
 
    public static uav_status.uav_status_t _decodeRecursiveFactory(DataInput ins) throws IOException
    {
        uav_status.uav_status_t o = new uav_status.uav_status_t();
        o._decodeRecursive(ins);
        return o;
    }
 
    public void _decodeRecursive(DataInput ins) throws IOException
    {
        this.timestamp = ins.readLong();
 
        this.position = new double[(int) 3];
        for (int a = 0; a < 3; a++) {
            this.position[a] = ins.readDouble();
        }
 
        this.orientation = new double[(int) 4];
        for (int a = 0; a < 4; a++) {
            this.orientation[a] = ins.readDouble();
        }
 
        this.mode = ins.readInt();
 
        this.send_count = ins.readLong();
 
    }
 
    public uav_status.uav_status_t copy()
    {
        uav_status.uav_status_t outobj = new uav_status.uav_status_t();
        outobj.timestamp = this.timestamp;
 
        outobj.position = new double[(int) 3];
        System.arraycopy(this.position, 0, outobj.position, 0, 3); 
        outobj.orientation = new double[(int) 4];
        System.arraycopy(this.orientation, 0, outobj.orientation, 0, 4); 
        outobj.mode = this.mode;
 
        outobj.send_count = this.send_count;
 
        return outobj;
    }
 
}
