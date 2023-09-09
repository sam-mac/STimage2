from torchvision.io import read_image
from torch.utils.data import Dataset

class VisiumClassificationDataset(Dataset):
    """
    X (image) -> y (class)
    """
    def __init__(self, df_data, transform=None, target_transform=None):
        self.df_data = df_data
        self.transform = transform
        self.target_transform = target_transform
        
    def __len__(self):
        return len(self.df_data)
    
    def __getitem__(self, idx):
        idx_name = self.df_data.index[idx]
        X_img = self.load_img(idx_name)
#         y = self.get_expression(idx_name)
        c = self.get_class(idx_name)
        return X_img, c
    
    def load_img(self, key):
        """load an image"""
        img_path = self.df_data.loc[key, 'tile_path']
        X_img = read_image(img_path)
            
        if self.transform:
            X_img = self.transform(X_img)
        
        return X_img
    
#     def get_expression(self, key):
#         y = torch.Tensor(adata_all[idx_name, gene_list].to_df().values)
        
#         if self.target_transform:
#             y = self.target_transform(y)
        
#         return y
    
    def get_class(self, key):
        c = self.df_data.loc[key, 'cancer_class']
        return c