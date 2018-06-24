function Ibw = traitement(Ibw,seuil,mask)
    Ibw(Ibw<seuil)=0;
    Ibw(Ibw~=0)=1;
    Ibw = imfill(Ibw,'holes');
    Ibw=immultiply(Ibw,mask);
end