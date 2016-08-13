// Added to ASCollectionDataSource:

/**
 * Data sources can override this method to return custom info associated with a
 * section of the collection view. 
 *
 * These section info objects can be read by a UICollectionViewLayout subclass
 * and used to configure the layout for that section. @see ASSectionInfo
 */
@optional
- (nullable ASSectionInfo *)collectionView:(ASCollectionView *)collectionView infoForSectionAtIndex:(NSInteger)sectionIndex;

// ----
// Added to ASCollectionView:

// Reads from data controller's _completedSections. Asserts that section index is in bounds.
- (ASSectionInfo *)infoForSectionAtIndex:(NSInteger)sectionIndex;

// ----
// In ASDataController.mm:

// Replace _editingNodes and _completedNodes with:
NSMutableArray<ASSectionInfo *> *_editingSections;
NSMutableArray<ASSectionInfo *> *_completedSections;

// Modify _reloadDataWithAnimationOptions and insertSections:withAnimationOptions:.
// In those methods we use _populateFromDataSourceWithSectionIndexSet to get the node blocks.
// Now we will also need to get/create the section infos, just before we get the node blocks.

// In essence, wherever we use an NSMutableArray of nodes to represent a section, we now
// will use an ASSectionInfo instead.