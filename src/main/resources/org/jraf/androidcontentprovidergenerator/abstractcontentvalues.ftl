<#if header??>
${header}
</#if>
package ${config.providerJavaPackage}.base;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;

public abstract class AbstractContentValues {
    protected final ContentValues mContentValues = new ContentValues();

    /**
     * Returns the {@code uri} argument to pass to the {@code ContentResolver} methods.
     */
    public abstract Uri uri();

    /**
     * Returns the {@code uri} argument to pass to the {@code ContentResolver} methods given a specific authority
     *
     * @param authority The authority to use.
     */
    public abstract Uri uri(String authority);

    /**
     * Returns the {@code ContentValues} wrapped by this object.
     */
    public ContentValues values() {
        return mContentValues;
    }

    /**
     * Inserts a row into a table using the values stored by this object.
     * 
     * @param contentResolver The content resolver to use.
     */
    public Uri insert(ContentResolver contentResolver) {
        return contentResolver.insert(uri(), values());
    }

    /**
     * Inserts a row into a table using the values stored by this object for an authority.
     * 
     * @param contentResolver The content resolver to use.
     */
    public Uri insert(String authority, ContentResolver contentResolver) {
        return contentResolver.insert(uri(authority), values());
    }
}